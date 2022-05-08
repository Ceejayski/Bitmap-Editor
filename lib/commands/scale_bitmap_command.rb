require_relative '../bitmap'
require_relative './default_command'
class ScaleBitmapCommand < DefaultCommand
  attr_reader :scale, :bitmap

  def initialize(*args)
    validate_command(1, *args)
    @scale = args[0].to_i
    @bitmap = args[1]
  end

  def perform
    bitmap.nil? ? bitmap_not_found : bitmap.resize(scale)
    bitmap
  end
end
