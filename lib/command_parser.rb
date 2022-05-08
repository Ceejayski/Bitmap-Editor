require_relative 'commands/create_bitmap_command'
require_relative 'commands/clear_canvas_command'
require_relative 'commands/set_pixel_color_command'
require_relative 'commands/fill_sibling_pixel_command'
require_relative 'commands/show_command'
require_relative 'commands/set_vertical_segment_command'
require_relative 'commands/set_horizontal_segment_command'
require_relative 'commands/scale_bitmap_command'
require_relative 'commands/help_command'

class CommandPaser
  COMMANDS = {
    'I' => CreateBitmapCommand,
    'L' => SetPixelColorCommand,
    'F' => FillSiblingPixelCommand,
    'C' => ClearCanvasCommand,
    'S' => ShowCommand,
    'V' => SetVerticalSegmentCommand,
    'H' => SetHorizontalSegmentCommand,
    'W' => ScaleBitmapCommand,
    '?' => HelpCommand
  }.freeze

  attr_reader :command, :args

  def initialize(command, params, bitmap = nil)
    @command = command
    @args = params
    @args << bitmap
  end

  def perform
    COMMANDS[command].new(*args).perform
  end
end
