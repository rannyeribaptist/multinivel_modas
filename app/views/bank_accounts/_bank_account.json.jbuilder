json.extract! bank_account, :id, :agency, :account_number, :type, :owner, :registration_number, :aditional_description, :created_at, :updated_at
json.url bank_account_url(bank_account, format: :json)
