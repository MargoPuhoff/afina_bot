Rails.application.routes.draw do
  devise_for :users
  resources :tg_users
  resources :tg_messages
  resources :tg_chats

  root 'home#index'

  telegram_webhook Telegram::WebhookController
  # post '/webhooks', to: 'webhooks#callback'
end
