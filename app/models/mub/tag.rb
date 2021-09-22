module Mub
  class Tag < ApplicationRecord
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
