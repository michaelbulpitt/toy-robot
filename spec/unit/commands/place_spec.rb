require_relative '../../../lib/commands/place'
require_relative '../../../lib/robot_simulator'
require_relative '../../../lib/robot'

RSpec.describe Commands::Place do
  let(:robot) { Robot.new }
  let(:robot_simulator) { RobotSimulator.new(robot: robot) }
  let(:x_position) { 0 }
  let(:y_position) { 0 }
  let(:orientation) { 'NORTH' }

  subject { described_class.new(robot_simulator: robot_simulator, arguments: [x_position, y_position, orientation]) }

  describe '#perform' do
    context 'command is valid' do
      it 'places robot' do
        arguments = { x_position: x_position, y_position: y_position, orientation: orientation }
        expect(robot).to receive(:place).with(arguments) { true }
        subject.perform
      end
    end

    context 'command is invalid' do
      before do
        allow(subject).to receive(:valid?) { false }
      end

      it 'returns false' do
        expect(subject.perform).to be_falsey
      end
    end
  end

  context '#valid?' do
    context 'invalid orientation' do
      let(:orientation) { 'SOUTHWEST' }

      it 'returns false' do
        expect(subject.valid?).to be_falsey
      end
    end

    context 'invalid position' do
      let(:y_position) { 5 }

      it 'returns false' do
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
