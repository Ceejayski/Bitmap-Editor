require_relative 'default_command'

class SetVerticalSegmentCommand < DefaultCommand
  attr_reader :y2, :y1, :x, :colour
  attr_accessor :bitmap

  def initialize(*args)
    validate_command(4, *args)
    @x = args[0].to_i
    @y1 = args[1].to_i
    @y2 = args[2].to_i
    @colour = args[3]
    @bitmap = args[4]
  end

  def perform
    bitmap.nil? ? bitmap_not_found : bitmap.set_vertical_line_color(x, y1, y2, colour)
    bitmap
  end
end
