module Mub
  class Tag < ApplicationRecord
    has_many :tag_associations, dependent: :destroy
    has_many :templates, through: :tag_associations
    validates :name, uniqueness: { scope: :value }
    validates :name, :value, presence: true
    validate :validate_underscore_snakecase_name

    def self.mub_property_value_options
      all.map do |tag|
        PropertyValueOption.new(name: tag.name, value: tag.value)
      end
    end

    def value=(val)
      val = nil if val.blank?
      super(val)
    end

    def serialize
      { name => value }
    end

    private

    def validate_underscore_snakecase_name
      regex = /\A[a-z0-9_]+\z/
      return if name.blank?
      return if regex.match?(name)
      self.errors.add(
        :name, 'must be a snakecased alphanumeric string'
      )
    end
  end
end

# == Schema Information
#
# Table name: mub_tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_mub_tags_on_name_and_value  (name,value) UNIQUE
#
