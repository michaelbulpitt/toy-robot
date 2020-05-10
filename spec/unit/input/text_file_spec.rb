require_relative '../../../lib/input/text_file'

RSpec.describe Input::TextFile do
  subject { described_class.new(file: file) }
  let(:file) { './spec/fixtures/correct_commands.txt' }
  let(:expected_output) do
    [
      'PLACE 0,0,NORTH',
      'MOVE',
      'REPORT',
      'PLACE 0,0,NORTH',
      'LEFT',
      'REPORT',
      'PLACE 1,2,EAST',
      'MOVE',
      'MOVE',
      'LEFT',
      'MOVE',
      'REPORT'
    ]
  end

  describe '#parse' do
    it 'parses file' do
      expect(subject.parse).to eq(expected_output)
    end
  end
end
