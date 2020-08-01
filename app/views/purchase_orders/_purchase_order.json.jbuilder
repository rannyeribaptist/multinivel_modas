json.extract! purchase_order, :id, :product_id, :quantity, :status, :created_at, :updated_at
json.url purchase_order_url(purchase_order, format: :json)
