module Export
  class Console
    attr_accessor :position

    def initialize(position:)
      @position = position
    end

    def perform
      return unless position
      puts position.values.join(',')
    end
  end
end
