json.extract! assemble_order, :id, :purchase_id, :user_id, :status, :created_at, :updated_at
json.url assemble_order_url(assemble_order, format: :json)
