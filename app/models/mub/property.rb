module Mub
  class Property < ApplicationRecord
  end
end

# == Schema Information
#
# Table name: mub_properties
#
#  id                  :bigint           not null, primary key
#  allow_modify        :boolean          not null
#  value               :jsonb
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  property_setting_id :bigint           not null
#  template_id         :bigint           not null
#
# Indexes
#
#  index_mub_properties_on_property_setting_id                  (property_setting_id)
#  index_mub_properties_on_property_setting_id_and_template_id  (property_setting_id,template_id) UNIQUE
#  index_mub_properties_on_template_id                          (template_id)
#
