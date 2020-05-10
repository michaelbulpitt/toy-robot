require_relative '../../lib/robot_processor'

RSpec.describe 'Processing robot commands' do
  let(:expected_output_1) { '0,1,NORTH' }
  let(:expected_output_2) { '0,0,WEST' }
  let(:expected_output_3) { '3,3,NORTH' }

  let(:correct_commands_file) { './spec/fixtures/correct_commands.txt' }
  let(:invalid_commands_file) { './spec/fixtures/invalid_commands.txt' }
  let(:invalid_file) { './spec/fixtures/invalid_file_type.csv' }

  let(:args) do
    { input: input }
  end

  subject { RobotProcessor.new(args) }

  describe 'with no file specified' do
    let(:input) { nil }

    it 'prints an error' do
      expect(STDOUT).to receive(:puts).with('File not provided')
      subject.run
    end
  end

  describe 'with invalid file' do
    let(:input) { invalid_file }

    it 'prints an error' do
      expect(STDOUT).to receive(:puts).with('Invalid file type')
      subject.run
    end
  end

  describe 'with valid commands' do
    let(:input) { correct_commands_file }

    it 'outputs correct REPORT commands to STDOUT' do
      expect(STDOUT).to receive(:puts).with(expected_output_1)
      expect(STDOUT).to receive(:puts).with(expected_output_2)
      expect(STDOUT).to receive(:puts).with(expected_output_3)
      subject.run
    end
  end

  describe 'with invalid commands' do
    let(:input) { invalid_commands_file }

    it 'does not output anything to STDOUT' do
      expect(STDOUT).to_not receive(:puts)
      subject.run
    end
  end
end
