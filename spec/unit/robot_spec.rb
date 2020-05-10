require_relative '../../lib/robot'

RSpec.describe Robot do
  subject { described_class.new }

  describe '#on_table?' do
    context 'with orientation' do
      before do
        subject.orientation = 'NORTH'
      end

      it 'returns true' do
        expect(subject.on_table?).to be_truthy
      end
    end

    context 'with no orientation' do
      it 'returns false' do
        expect(subject.on_table?).to be_falsey
      end
    end
  end

  describe '#place' do
    it 'assigns correct values to robot' do
      subject.place(x_position: 1, y_position: 1, orientation: 'NORTH')

      expect(subject.x_position).to eq(1)
      expect(subject.y_position).to eq(1)
      expect(subject.orientation).to eq('NORTH')
    end
  end

  describe '#position' do
    let(:expected_hash) do
      {
        x_position: 1,
        y_position: 1,
        orientation: 'NORTH'
      }
    end

    before do
      subject.place(expected_hash)
    end

    it 'returns position hash' do
      expect(subject.position).to eq(expected_hash)
    end
  end
end
