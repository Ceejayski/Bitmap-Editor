require_relative '../bitmap'
require_relative './default_command'
class CreateBitmapCommand < DefaultCommand
  attr_reader :width, :height

  def initialize(*args)
    validate_command(2, *args)
    @width = args[0].to_i
    @height = args[1].to_i
  end

  def perform
    Bitmap.new(width, height)
  end
end
