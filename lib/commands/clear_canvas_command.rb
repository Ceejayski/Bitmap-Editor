require_relative './default_command'
class ClearCanvasCommand < DefaultCommand
  attr_reader :bitmap

  def initialize(*args)
    @bitmap = args[0]
  end

  def perform
    bitmap.clear_canvas
    bitmap
  end
end
