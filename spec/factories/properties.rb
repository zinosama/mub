FactoryBot.define do
  factory :property, class: 'Mub::Property' do
    template { build(:template) }
    allow_modify { true }
    property_setting { build(:property_setting) }

    transient do
      column_name { 'name' }
    end

    after(:build) do |property, evaluator|
      property.property_setting ||= build(
        :property_setting,
        name: evaluator.column_name,
        resource_type: property.template.resource_type
      )
    end
  end
end
