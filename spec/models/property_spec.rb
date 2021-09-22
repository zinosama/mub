module Mub
  RSpec.describe Property, type: :model do
    it 'has valid factory' do
      expect(build(:property)).to be_valid
    end

    describe '#value=' do
      let(:property) { build(:property) }

      context 'when input is empty' do
        it 'sets to nil' do
          property.value = '  '
          expect(property.value).to be_nil
        end
      end

      context 'when input is not empty' do
        it 'sets to input' do
          property.value = 'foo'
          expect(property.value).to eq 'foo'
        end
      end
    end
  end
end
