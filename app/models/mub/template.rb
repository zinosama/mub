module Mub
  class Template < ApplicationRecord
    validates :resource_type, :name, :classification, presence: true
    validates :name, uniqueness: { scope: :resource_type }
  end
end

# == Schema Information
#
# Table name: mub_templates
#
#  id             :bigint           not null, primary key
#  activated_at   :datetime
#  classification :string           not null
#  description    :text
#  name           :string           not null
#  resource_type  :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_mub_templates_on_activated_at            (activated_at)
#  index_mub_templates_on_resource_type_and_name  (resource_type,name) UNIQUE
#
