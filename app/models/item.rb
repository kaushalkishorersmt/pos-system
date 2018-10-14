class Item < ApplicationRecord
  has_many :items_tag
  has_many :tags, through: :items_tag
end
