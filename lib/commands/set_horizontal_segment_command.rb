require_relative 'default_command'

class SetHorizontalSegmentCommand < DefaultCommand
  attr_reader :y, :x1, :x2, :colour, :bitmap

  def initialize(*args)
    validate_command(4, *args)
    @x1 = args[0].to_i
    @x2 = args[1].to_i
    @y = args[2].to_i
    @colour = args[3]
    @bitmap = args[4]
  end

  def perform
    bitmap.nil? ? bitmap_not_found : bitmap.set_horizontal_line_color(x1, x2, y, colour)
    bitmap
  end
end
