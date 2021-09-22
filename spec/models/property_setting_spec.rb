module Mub
  RSpec.describe PropertySetting, type: :model do
    describe '#has_value_options?' do
      context 'when there is fk entity' do
        it 'returns true' do
          setting = build(:property_setting, fk_entity: 'Mub::Tag')
          expect(setting.has_value_options?).to be true
        end
      end

      context 'when there is no fk entity' do
        it 'returns false' do
          setting = build(:property_setting, fk_entity: nil)
          expect(setting.has_value_options?).to be false
        end
      end
    end

    describe '#value_options' do
      context 'when there is fk entity' do
        it 'returns values from fk entity' do
          allow(Tag).to receive(:mub_property_value_options)
            .and_return(:foo)
          setting = build(:property_setting, fk_entity: 'Mub::Tag')
          expect(setting.value_options).to eq :foo
        end
      end

      context 'when there is no fk entity' do
        it 'raises exception' do
          setting = build(:property_setting, fk_entity: nil)
          expect { setting.value_options }.to raise_exception(
            'No fk entity'
          )
        end
      end
    end
  end
end
