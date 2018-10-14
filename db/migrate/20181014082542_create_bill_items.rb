class CreateBillItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_items do |t|
      t.integer :item_id
      t.integer :quantity
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
