require_relative '../../lib/command_processor'
require_relative '../../lib/robot_simulator'

RSpec.describe CommandProcesor do
  let(:robot) { Robot.new }
  let(:robot_simulator) { RobotSimulator.new(robot: robot) }
  subject { described_class.new(commands: [], robot_simulator: robot_simulator) }

  before do
    robot.place(x_position: 1, y_position: 1, orientation: 'NORTH')
  end

  describe '#process_command?' do
    context 'PLACE command' do
      context 'valid arguments' do
        let(:command) { 'PLACE 1,2,NORTH' }

        it 'returns true' do
          expect(subject.process_command(command)).to be_truthy
        end
      end

      context 'invalid arguments' do
        let(:command) { 'PLACE' }

        it 'returns true' do
          expect(subject.process_command(command)).to be_falsey
        end
      end
    end

    context 'LEFT command' do
      let(:command) { 'LEFT' }

      it 'returns true' do
        expect(subject.process_command(command)).to be_truthy
      end
    end

    context 'RIGHT command' do
      let(:command) { 'RIGHT' }

      it 'returns true' do
        expect(subject.process_command(command)).to be_truthy
      end
    end

    context 'MOVE command' do
      let(:command) { 'MOVE' }

      it 'returns true' do
        expect(subject.process_command(command)).to be_truthy
      end
    end
  end
end
