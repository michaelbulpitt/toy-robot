module Commands
  class Base
    def initialize(robot_simulator:, arguments:)
      @robot_simulator = robot_simulator
      @arguments = arguments
      @robot = robot_simulator.robot
    end

    def perform
      raise NotImplementedError, 'Command classes must implement #perform'
    end

    private

    def current_robot_position
      @robot.position
    end

    def place_robot
      @place_robot ||= Commands::Place.new(
        robot_simulator: @robot_simulator,
        arguments: next_position_arguments
      )
    end
  end
end
