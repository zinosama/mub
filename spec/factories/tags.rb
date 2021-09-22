FactoryBot.define do
  factory :tag, class: 'Mub::Tag' do
    sequence(:name) { |n| "tag_#{n}" }
    value { 'foo' }
  end
end
