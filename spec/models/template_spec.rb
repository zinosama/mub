module Mub
  RSpec.describe Template, type: :model do
    it 'has valid factory' do
      expect(build(:template)).to be_valid
    end

    describe '#serialize' do
      let(:tag) { build(:tag, name: 'use_case', value: 'unknown') }
      let(:property) { build(:property, column_name: 'description', value: 'foo') }

      it 'returns hash of key-value pairs including tag and properties' do
        template = build(:template)
        template.tags = [tag]
        template.properties = [property]

        expect(template.serialize).to match(
          'use_case' => 'unknown',
          'description' => 'foo'
        )
      end
    end

    describe '#activated=' do
      context 'when input is true' do
        context 'when already activated' do
          it 'does nothing' do
            template = build(:template, activated_at: 1.day.ago)
            expect { template.activated = true }.not_to change { template.activated_at }
          end
        end

        context 'when not activated' do
          it 'sets activated_at' do
            template = build(:template, activated_at: nil)
            expect { template.activated = '1' }
              .to change { template.activated_at }.to be_present
          end
        end
      end

      context 'when input is false' do
        it 'removes existing activated_at' do
          template = build(:template, activated_at: 1.day.ago)
          expect { template.activated = false }
            .to change { template.activated_at }.to be_nil
        end
      end
    end
  end
end
