json.extract! tg_chat, :id, :created_at, :updated_at
json.url tg_chat_url(tg_chat, format: :json)
