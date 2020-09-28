json.extract! withdraw, :id, :amount, :user_id, :status, :created_at, :updated_at
json.url withdraw_url(withdraw, format: :json)
