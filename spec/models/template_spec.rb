module Mub
  RSpec.describe Template, type: :model do
    it 'has valid factory' do
      expect(build(:template)).to be_valid
    end
  end
end
