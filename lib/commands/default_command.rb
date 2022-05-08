class DefaultCommand
  def initialize(*args); end

  def validate_command(command_count, *args)
    raise 'Too many arguments provided for command' if command_count.zero? && !(args.count - 1).zero?
    raise 'Too many arguments provided for command' if (args.count - 1) > command_count
    raise 'Too few arguments provided for command' if (args.count - 1) < command_count
  end

  def bitmap_not_found
    puts 'No bitmap found'
  end
end
