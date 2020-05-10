require_relative '../../../lib/input/processor'

RSpec.describe Input::Processor do
  subject { described_class.new(input: input) }
  let(:input) { './spec/fixtures/correct_commands.txt' }

  describe '#initialize' do
    context 'with a valid text file' do
      it 'returns Input:TextFile class' do
        expect(subject).to be_an_instance_of(Input::TextFile)
      end
    end

    context 'with no file' do
      let(:input) { nil }

      it 'raises RuntimeError' do
        expect { subject }.to raise_error(RuntimeError, 'File not provided')
      end
    end

    context 'with invalid file_type' do
      let(:input) { './spec/fixtures/invalid_file_type.csv' }

      it 'raises RuntimeError' do
        expect { subject }.to raise_error(RuntimeError, 'Invalid file type')
      end
    end
  end
end
