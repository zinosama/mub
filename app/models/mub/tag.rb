module Mub
  class Tag < ApplicationRecord
    has_many :tag_associations, dependent: :destroy
    has_many :templates, through: :tag_associations
    validates :name, snakecase_alphanumeric: true, uniqueness: { scope: :value }
    validates :name, :value, presence: true

    def value=(val)
      val = nil if val.blank?
      super(val)
    end

    def serialize
      { name.to_sym => value }
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
