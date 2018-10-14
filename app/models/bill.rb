class Bill < ApplicationRecord
  has_many :bill_items, dependent: :destroy
  accepts_nested_attributes_for :bill_items
  # after_save :calculate_total

  # def calculate_total
  #   total_price = 0
  #   self.bill_items.each do |bill_item|
  #     @item = Item.find(bill_item.item_id)
  #     total_price += @item.price * bill_item.quantity
  #   end
  #   self.update_attributes(total: total_price)
  # end

end
