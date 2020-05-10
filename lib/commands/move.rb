require_relative 'base'

module Commands
  class Move < Base
    def perform
      return unless valid?
      place_robot.perform
    end

    def valid?
      @robot.on_table? && place_robot.valid?
    end

    private

    def next_position_arguments
      current_robot_position.merge(@robot.movements) do |_, current_value, new_value|
        current_value + new_value
      end.values
    end
  end
end
