class Table
  MAX_WIDTH = 5
  MAX_HEIGHT = 5

  def initialize(width: MAX_WIDTH, height: MAX_HEIGHT)
    @x_range = Range.new(0, width - 1)
    @y_range = Range.new(0, height - 1)
  end

  def valid_position?(x_position:, y_position:)
    @x_range.cover?(x_position) && @y_range.cover?(y_position)
  end
end
