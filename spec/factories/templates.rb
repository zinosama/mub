FactoryBot.define do
  factory :template, class: 'Mub::Template' do
    resource_type { 'Mub::Tag' }
    sequence(:name) { |n| "template-#{n}" }
    classification { 'core' }
  end
end
