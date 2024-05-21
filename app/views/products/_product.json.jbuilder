json.extract! product, :id, :name, :weight, :width, :length, :valueSell, :valueBuy, :depth, :quantity, :description, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
