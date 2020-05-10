require_relative '../../../lib/export/console'

RSpec.describe Export::Console do
  subject { described_class.new(position: position) }
  let(:position) do
    { x_position: 4, y_position: 4, position: 'NORTH' }
  end

  describe '#perform' do
    context 'with valid position' do
      it 'logs position in correct format' do
        expect(STDOUT).to receive(:puts). with('4,4,NORTH')
        subject.perform
      end
    end

    context 'no position' do
      let(:position) { nil }

      it 'returns false' do
        expect(subject.perform).to be_falsey
      end
    end
  end
end
