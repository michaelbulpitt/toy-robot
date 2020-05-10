require_relative 'base'
require_relative '../export/console'

module Commands
  class Report < Base
    def perform
      return unless @robot.on_table?

      exporter = ::Export::Console.new(position: @robot.position)
      exporter.perform
    end
  end
end
