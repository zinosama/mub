module Mub
  class TagAssociation < ApplicationRecord
    belongs_to :template
    belongs_to :tag
  end
end

# == Schema Information
#
# Table name: mub_tag_associations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag_id      :bigint           not null
#  template_id :bigint           not null
#
# Indexes
#
#  index_mub_tag_associations_on_tag_id       (tag_id)
#  index_mub_tag_associations_on_template_id  (template_id)
#
