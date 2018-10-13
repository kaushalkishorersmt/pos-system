class Tag < ApplicationRecord
  # belongs_to :item
  has_many :items_tag
end
