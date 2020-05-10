require_relative 'robot_simulator'
require_relative 'command_processor'
require_relative './input/processor'

class RobotProcessor
  def initialize(input:, robot_simulator: RobotSimulator.new)
    @input = input
    @robot_simulator = robot_simulator
  end

  def run
    input_processor = Input::Processor.new(input: @input)
    command_processor = CommandProcesor.new(commands: input_processor.parse, robot_simulator: @robot_simulator)
    command_processor.process
  rescue RuntimeError => e
    puts e.message
  end
end
