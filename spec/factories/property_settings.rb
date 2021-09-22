FactoryBot.define do
  factory :property_setting, class: 'Mub::PropertySetting' do
    name { 'description' }
    resource_type { 'Mub::Tag' }
    setter_method_name { 'description=' }
    target_column { 'products.description' }
  end
end
