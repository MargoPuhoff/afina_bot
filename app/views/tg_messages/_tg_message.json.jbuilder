json.extract! tg_message, :id, :created_at, :updated_at
json.url tg_message_url(tg_message, format: :json)
