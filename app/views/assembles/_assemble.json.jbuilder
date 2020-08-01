json.extract! assemble, :id, :purchase_id, :user_id, :status, :created_at, :updated_at
json.url assemble_url(assemble, format: :json)
