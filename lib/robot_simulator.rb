require_relative 'robot'

class RobotSimulator
  attr_accessor :robot

  def initialize(robot: Robot.new)
    @robot = robot
  end
end
