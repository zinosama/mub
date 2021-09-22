module Mub
  class PropertySetting < ApplicationRecord
    FK_QUERY_METHOD = :mub_property_value_options

    has_many :properties
    validates :name, :setter_method_name, :target_column, presence: true
    validates :fk_entity,
      inclusion: { in: Mub.configuration.fk_entities },
      optional: true
    validates :resource_type, inclusion: { in: Mub.configuration.resource_types }

    def has_value_options?
      fk_entity.present?
    end

    def value_options
      raise 'No fk entity' unless has_value_options?
      fk_entity.constantize.public_send(FK_QUERY_METHOD)
    end
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
