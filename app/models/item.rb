class Item < ApplicationRecord
  # belongs_to :tag
  has_many :items_tag
end
