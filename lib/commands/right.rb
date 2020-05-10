require_relative 'base'

module Commands
  class Right < Base
    def perform
      return unless @robot.on_table?
      place_robot.perform
    end

    private

    def next_position_arguments
      current_robot_position.merge(next_orientation).values
    end

    def next_orientation
      { orientation: Robot::ORIENTATIONS[Robot::ORIENTATIONS.index(@robot.orientation) + 1] }
    end
  end
end
