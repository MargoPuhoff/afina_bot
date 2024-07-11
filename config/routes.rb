Rails.application.routes.draw do
  resources :tg_users
  resources :tg_messages
  resources :tg_chats
  get "up" => "rails/health#show", as: :rails_health_check
  telegram_webhook Telegram::WebhookController
end
