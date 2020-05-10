Dir[File.join(File.dirname(__FILE__), 'commands/*.rb')].each { |file| require file }

class CommandProcesor
  def initialize(commands:, robot_simulator:)
    @robot_simulator = robot_simulator
    @commands = commands
  end

  def process
    @commands.each do |command|
      process_command(command)
    end
  end

  def process_command(command)
    command = command.tr(',', ' ').split
    command_name = command[0]
    command_args = command[1..-1]
    command = valid_commands.fetch(command_name) { nil }

    return unless command

    command = command.new(robot_simulator: @robot_simulator, arguments: command_args)
    command.perform
  end

  private

  def valid_commands
    {
      'REPORT' => Commands::Report,
      'PLACE' => Commands::Place,
      'RIGHT' => Commands::Right,
      'LEFT' => Commands::Left,
      'MOVE' => Commands::Move
    }
  end
end
