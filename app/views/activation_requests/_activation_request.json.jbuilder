json.extract! activation_request, :id, :user_id, :requested_id, :created_at, :updated_at
json.url activation_request_url(activation_request, format: :json)
