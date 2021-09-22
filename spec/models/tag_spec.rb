module Mub
  RSpec.describe Tag, type: :model do
    describe '.mub_property_value_options' do
      it 'returns all records as value options' do
        tag_1 = create(:tag)
        tag_2 = create(:tag)
        expect(described_class.mub_property_value_options)
          .to contain_exactly(
            have_attributes(name: tag_1.name, value: tag_1.value),
            have_attributes(name: tag_2.name, value: tag_2.value)
          )
      end
    end

    describe '#validate_underscore_snakecase_name' do
      context 'when name contains space' do
        it 'sets error' do
          setting = build(:tag, name: 'foo bar')
          expect(setting).to be_invalid
          expect(setting.errors[:name]).to include(
            'must be a snakecased alphanumeric string'
          )
        end
      end

      context 'when name contains upper case' do
        it 'sets error' do
          setting = build(:tag, name: 'Foo')
          expect(setting).to be_invalid
          expect(setting.errors[:name]).to include(
            'must be a snakecased alphanumeric string'
          )
        end
      end
    end

    describe '#value=' do
      let(:tag) { build(:tag) }

      context 'when input is empty' do
        it 'sets to nil' do
          tag.value = '  '
          expect(tag.value).to be_nil
        end
      end

      context 'when input is not empty' do
        it 'sets to input' do
          tag.value = 'foo'
          expect(tag.value).to eq 'foo'
        end
      end
    end
  end
end
