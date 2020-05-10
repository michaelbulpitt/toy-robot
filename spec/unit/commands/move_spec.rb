require_relative '../../../lib/commands/move'
require_relative '../../../lib/commands/place'
require_relative '../../../lib/robot_simulator'
require_relative '../../../lib/robot'

RSpec.describe Commands::Move do
  let(:robot) { Robot.new }
  let(:robot_simulator) { RobotSimulator.new(robot: robot) }

  subject { described_class.new(robot_simulator: robot_simulator, arguments: nil) }

  describe '#perform' do
    context 'command is valid' do
      let(:place_command) { double(valid?: true) }

      context 'move robot north' do
        before do
          robot.place(x_position: 0, y_position: 0, orientation: 'NORTH')
        end

        it 'moves robot' do
          arguments = { robot_simulator: robot_simulator, arguments: [0, 1, 'NORTH'] }
          expect(Commands::Place).to receive(:new).with(arguments) { place_command }
          expect(place_command).to receive(:perform) { true }
          subject.perform
        end
      end

      context 'move robot east' do
        before do
          robot.place(x_position: 0, y_position: 0, orientation: 'EAST')
        end

        it 'moves robot' do
          arguments = { robot_simulator: robot_simulator, arguments: [1, 0, 'EAST'] }
          expect(Commands::Place).to receive(:new).with(arguments) { place_command }
          expect(place_command).to receive(:perform) { true }
          subject.perform
        end
      end

      context 'move robot west' do
        before do
          robot.place(x_position: 1, y_position: 1, orientation: 'WEST')
        end

        it 'moves robot' do
          arguments = { robot_simulator: robot_simulator, arguments: [0, 1, 'WEST'] }
          expect(Commands::Place).to receive(:new).with(arguments) { place_command }
          expect(place_command).to receive(:perform) { true }
          subject.perform
        end
      end

      context 'move robot south' do
        before do
          robot.place(x_position: 1, y_position: 1, orientation: 'SOUTH')
        end

        it 'moves robot' do
          arguments = { robot_simulator: robot_simulator, arguments: [1, 0, 'SOUTH'] }
          expect(Commands::Place).to receive(:new).with(arguments) { place_command }
          expect(place_command).to receive(:perform) { true }
          subject.perform
        end
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
    context 'robot not placed' do
      it 'returns false' do
        expect(subject.valid?).to be_falsey
      end
    end

    context 'invalid position' do
      before do
        robot.place(x_position: 4, y_position: 4, orientation: 'NORTH')
      end

      it 'returns false' do
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
