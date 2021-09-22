module Mub
  class Template < ApplicationRecord
    validates :resource_type, inclusion: { in: Mub.configuration.resource_types }
    validates :name, :classification, presence: true
    validates :name, uniqueness: { scope: :resource_type }

    has_many :properties, dependent: :destroy
    has_many :tag_associations, dependent: :destroy
    has_many :tags, through: :tag_associations

    scope :activated, -> { where('activated_at IS NOT NULL') }

    # def columns_to_configure
    #   configurable_columns - properties.map(&:column_name)
    # end

    def activated
      !!activated_at
    end

    def activated=(val)
      if val
        self.activated_at ||= Time.current
      else
        self.activated_at = nil
      end
    end

    def serialize
      serialized_tags = tags.inject({}) do |collection, tag|
        collection.merge!(tag.serialize)
      end
      properties.inject(serialized_tags) do |collection, property|
        collection.merge!(property.serialize)
      end
    end

    # private

    # def configurable_columns
    #   resource_type.constantize.column_names - IGNORED_BILLABLE_COL_NAMES
    # end
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
