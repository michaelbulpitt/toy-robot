require_relative '../../lib/table'

RSpec.describe Table do
  subject { described_class.new }

  describe '#valid_position?' do
    context 'invalid position' do
      let(:args) do
        { x_position: 5, y_position: 5 }
      end

      it 'returns true' do
        expect(subject.valid_position?(args)).to be_falsey
      end
    end

    context 'valid position' do
      let(:args) do
        { x_position: 4, y_position: 4 }
      end

      it 'returns true' do
        expect(subject.valid_position?(args)).to be_truthy
      end
    end
  end
end
