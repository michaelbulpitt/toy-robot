require_relative '../../lib/robot_processor'
require_relative '../../lib/robot_simulator'

RSpec.describe RobotProcessor do
  let(:robot_simulator) { RobotSimulator.new }
  let(:file) { './spec/fixtures/correct_commands.txt' }
  subject { described_class.new(input: file, robot_simulator: robot_simulator) }

  describe '#run' do
    context 'with valid file' do
      let(:file_processor) { double(parse: ['PLACE 0,0,NORTH']) }
      let(:command_processor) { double }
      let(:processor_args) { { commands: file_processor.parse, robot_simulator: robot_simulator } }

      it 'processes file' do
        expect(Input::Processor).to receive(:new).with(input: file) { file_processor }
        expect(CommandProcesor).to receive(:new).with(processor_args) { command_processor }
        expect(command_processor).to receive(:process) { true }
        subject.run
      end
    end

    context 'with no file' do
      let(:file) { nil }

      it 'raises error' do
        expect(STDOUT).to receive(:puts).with('File not provided')
        subject.run
      end
    end

    context 'with invalid file type' do
      let(:file) { './spec/fixtures/invalid_file_type.csv' }

      it 'raises error' do
        expect(STDOUT).to receive(:puts).with('Invalid file type')
        subject.run
      end
    end
  end
end
