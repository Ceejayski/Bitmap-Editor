require_relative './default_command'
class SetPixelColorCommand < DefaultCommand
  attr_reader :bitmap, :x, :y, :color

  def initialize(*args)
    validate_command(3, *args)
    @x = args[0].to_i
    @y = args[1].to_i
    @color = args[2]
    @bitmap = args[3]
  end

  def perform
    bitmap.nil? ? bitmap_not_found : bitmap.set_canvas_color(x, y, color)
    bitmap
  end
end
