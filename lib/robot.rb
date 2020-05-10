require_relative 'table'

class Robot
  ORIENTATIONS = [
    NORTH = 'NORTH'.freeze,
    EAST = 'EAST'.freeze,
    SOUTH = 'SOUTH'.freeze,
    WEST = 'WEST'.freeze
  ].freeze

  attr_accessor :table, :y_position, :x_position, :orientation

  def initialize(table: Table.new)
    @table = table
  end

  def place(x_position:, y_position:, orientation:)
    @x_position = x_position
    @y_position = y_position
    @orientation = orientation
  end

  def position
    {
      x_position: x_position,
      y_position: y_position,
      orientation: orientation
    }
  end

  def on_table?
    !@orientation.nil?
  end

  def movements
    case @orientation
    when NORTH
      { y_position: 1 }
    when SOUTH
      { y_position: -1 }
    when WEST
      { x_position: -1 }
    when EAST
      { x_position: 1 }
    end
  end
end
