json.extract! user, :id, :name, :role, :graduation, :level, :avatar, :phone, :social_security_number, :tax_number, :created_at, :updated_at
json.url user_url(user, format: :json)
