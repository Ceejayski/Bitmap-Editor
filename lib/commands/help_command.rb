require_relative './default_command'
class HelpCommand < DefaultCommand
  attr_reader :bitmap

  def initialize(*args)
    validate_command(0, *args)
    @bitmap = args[1]
  end

  def perform
    print("
    Commands\n
    I M N =>\n
    \tCreate a new M x N canvas with all pixels coloured white (O).\n
    C =>\n
    \tClears the canvas, setting all pixels to white (O).\n
    L X Y C =>\n
    \tColours the pixel (X,Y) with colour C.\n
    V X Y1 Y2 C =>\n
    \tDraw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).\n
    H X1 X2 Y C =>\n
    \tDraw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).\n
    F X Y C =>\n
    \tFill the region R with the colour C. R is defined as\n
    W F =>\n
    \tScales the canvas with the given factor F (in percentage)\n.
    S =>\n
    \tShow the contents of the current canvas\n
    X =>\n
    \tTerminate the session\n
    ? =>\n
    \tShows in program help\n
    ")
    bitmap
  end
end
