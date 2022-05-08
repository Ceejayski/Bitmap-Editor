class Bitmap
  PIXEL_CORDINATE_LIMIT = (1..250).to_a

  class InvalidCordinates < StandardError
    def message
      'Invalid cordinate, must be btwn 1 - 250'
    end
  end

  class InvalidCanvasCordinate < StandardError
    def message
      'Invalid canvas, please check your coordinates'
    end
  end

  class OutOfLimitError < StandardError
    def message
      "Bitmap coordinates are out of limits"
    end
  end

  attr_reader :width, :height
  attr_accessor :canvas

  def initialize(width, height)
    @width = width
    @height = height
    @canvas = new_bitmap(width, height)
  end

  def new_bitmap(width, height)
    raise InvalidCordinates if invalid_cordinates?(width, height)

    Array.new(height) { Array.new(width, 'O') }
  end

  def clear_canvas
    canvas.map { |row| row.fill('O') }
  end

  def set_canvas_color(x, y, color)
    validate_coord_input(x, y, color)
    canvas[y - 1][x - 1] = color
  end

  def set_vertical_line_color(x, y1, y2, colour)
    raise OutOfLimitError if vertical_line_invalid_canvas_cordinate?(x, y1, y2)
    no_color_message if colour.nil?
    canvas[(y1 - 1)..(y2 - 1)].map { |row| row[x - 1] = colour }
  end

  def set_horizontal_line_color(x1, x2, y, colour)
    raise OutOfLimitError if horizontal_line_invalid_canvas_cordinate?(x1, x2, y)
    no_color_message if colour.nil?
    canvas[y - 1].fill(colour, (x1 - 1)..(x2 - 1))
  end

  def region_fill(x, y, colour)
    validate_coord_input(x, y, colour)
    target_color = canvas[y - 1][x - 1]
    fill_color(x, y, target_color, colour)
  end

  def resize(scale)
    scale_up = scale > 100
    row_size = ((scale / 100) - 1) * @width
    column_size = ((scale / 100) - 1) * @height
    if scale_up
      @canvas = @canvas.collect do |rows|
        additional_rows = ['O'] * row_size
        rows.unshift(*additional_rows)
      end
      additional_column = Array.new(@canvas[0].size, '0')
      column_size.times do |_x|
        @canvas << additional_column
      end
    else
      raise "Can't Scale down" if scale / 10 > width || scale / 10 > height

      @canvas = @canvas.collect { |x| x[row_size, x.size - 1] }
      @canvas = @canvas[0, column_size - 1]
    end
    @width = @canvas[0].size
    @height = @canvas.size
  end

  private

  def invalid_cordinates?(x, y)
    !(PIXEL_CORDINATE_LIMIT.include?(x) && PIXEL_CORDINATE_LIMIT.include?(y))
  end

  def fill_color_out_of_limit(x, y)
    invalid_canvas_cordinate?(x, width) || invalid_canvas_cordinate?(y, height)
  end

  def invalid_canvas_cordinate?(cordinate, max_canvas_vertice)
    cordinate.negative? || cordinate > max_canvas_vertice
  end

  def validate_coord_input(x, y, color)
    raise StandardError, 'No color provided' if color.nil?
    raise InvalidCanvasCordinate if invalid_canvas_cordinate?(x, width) || invalid_canvas_cordinate?(y, height)
  end

  def vertical_line_invalid_canvas_cordinate?(x, y1, y2)
    invalid_canvas_cordinate?(x,
                              width) || invalid_canvas_cordinate?(y1, height) || invalid_canvas_cordinate?(y2, height)
  end

  def horizontal_line_invalid_canvas_cordinate?(x1, x2, y)
    invalid_canvas_cordinate?(x1,
                              width) || invalid_canvas_cordinate?(x2, width) || invalid_canvas_cordinate?(y, height)
  end

  def fill_color(x, y, target_color, replacement_color)
    return if target_color == replacement_color
    return if fill_color_out_of_limit(x, y) || (canvas[y - 1][x - 1] != target_color)

    canvas[y - 1][x - 1] = replacement_color
    fill_region_around(x, y, target_color, replacement_color)
  end

  def fill_region_around(x, y, target_color, replacement_color)
    fill_color(x + 1, y, target_color, replacement_color)
    fill_color(x - 1, y, target_color, replacement_color)
    fill_color(x, y + 1, target_color, replacement_color)
    fill_color(x, y - 1, target_color, replacement_color)
  end
end
