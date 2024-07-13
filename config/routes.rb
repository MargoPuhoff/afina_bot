Rails.application.routes.draw do
  resources :tg_users
  resources :tg_messages
  resources :tg_chats

  root 'tg_chat#index'

  telegram_webhook Telegram::WebhookController
  # post '/webhooks', to: 'webhooks#callback'
end
