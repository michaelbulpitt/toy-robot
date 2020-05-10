require_relative '../../../lib/commands/left'
require_relative '../../../lib/commands/place'
require_relative '../../../lib/robot_simulator'
require_relative '../../../lib/robot'

RSpec.describe Commands::Left do
  let(:robot) { Robot.new }
  let(:robot_simulator) { RobotSimulator.new(robot: robot) }

  subject { described_class.new(robot_simulator: robot_simulator, arguments: nil) }

  describe '#perform' do
    context 'robot is placed' do
      let(:place_command) { double }

      before do
        robot.place(x_position: 1, y_position: 1, orientation: 'NORTH')
      end

      it 'rotates robot' do
        arguments = { robot_simulator: robot_simulator, arguments: [1, 1, 'WEST'] }
        expect(Commands::Place).to receive(:new).with(arguments) { place_command }
        expect(place_command).to receive(:perform) { true }
        subject.perform
      end
    end

    context 'robot is not placed' do
      before do
        allow(robot).to receive(:on_table?) { false }
      end

      it 'returns false' do
        expect(subject.perform).to be_falsey
      end
    end
  end
end
