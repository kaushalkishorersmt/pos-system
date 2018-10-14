class Tag < ApplicationRecord
  has_many :items_tag
  has_many :items, through: :items_tag
end
