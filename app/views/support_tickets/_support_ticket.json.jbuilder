json.extract! support_ticket, :id, :ticket, :filled_by, :purchase_id, :created_at, :updated_at
json.url support_ticket_url(support_ticket, format: :json)
