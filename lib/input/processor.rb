require_relative 'text_file'

module Input
  FILE_MAPPINGS = {
    '.txt' => Input::TextFile
  }.freeze

  class Processor
    def self.new(input:)
      raise 'File not provided' if input.nil? || !File.exist?(input)

      extension_name = File.extname(input)
      klass = FILE_MAPPINGS[extension_name]

      raise 'Invalid file type' if klass.nil?

      klass.new(file: input)
    end
  end
end
