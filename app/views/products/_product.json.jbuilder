json.extract! product, :id, :user_id, :name, :description, :price, :hidden, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
