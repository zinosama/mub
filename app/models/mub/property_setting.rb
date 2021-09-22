module Mub
  class PropertySetting < ApplicationRecord
  end
end

# == Schema Information
#
# Table name: mub_property_settings
#
#  id                 :bigint           not null, primary key
#  fk_entity          :string
#  name               :string           not null
#  resource_type      :string           not null
#  setter_method_name :string           not null
#  target_column      :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_mub_property_settings_on_resource_type  (resource_type)
#
