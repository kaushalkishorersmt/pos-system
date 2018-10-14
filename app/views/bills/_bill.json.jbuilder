json.extract! bill, :id, :item_ids, :quantity, :total, :created_at, :updated_at
json.url bill_url(bill, format: :json)
