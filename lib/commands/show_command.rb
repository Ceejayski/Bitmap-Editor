require_relative './default_command'
class ShowCommand < DefaultCommand
  attr_reader :bitmap

  def initialize(*args)
    validate_command(0, *args)
    @bitmap = args[0]
  end

  def perform
    if @bitmap.nil?
      @bitmap = Bitmap.new(1, 1)
      @bitmap.set_canvas_color(1, 1, 'A')
    end
    puts @bitmap.canvas.map(&:join).join("\n")
    @bitmap
  end
end
