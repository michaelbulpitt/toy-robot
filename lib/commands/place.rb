require_relative 'base'

module Commands
  class Place < Base
    def perform
      return unless valid?

      @robot.place(
        x_position: x_position, y_position: y_position, orientation: orientation
      )
    end

    def valid?
      valid_orientation? && valid_position?
    end

    private

    def x_position
      @x_position ||= @arguments[0].to_i
    end

    def y_position
      @y_position ||= @arguments[1].to_i
    end

    def orientation
      @orientation ||= @arguments[2]
    end

    def valid_position?
      @robot_simulator.robot.table.valid_position?(
        x_position: x_position,
        y_position: y_position
      )
    end

    def valid_orientation?
      Robot::ORIENTATIONS.include?(orientation)
    rescue KeyError
      false
    end
  end
end
