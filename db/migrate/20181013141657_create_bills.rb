class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.integer :item_ids, array: true, default: '{}'
      t.integer :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
