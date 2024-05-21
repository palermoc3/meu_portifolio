json.extract! item_purchase, :id, :purchase_id, :product_id, :value, :quantity, :created_at, :updated_at
json.url item_purchase_url(item_purchase, format: :json)
