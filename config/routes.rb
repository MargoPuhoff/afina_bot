Rails.application.routes.draw do
  devise_for :users
  resources :tg_users
  resources :tg_messages
  resources :tg_chats

  root 'home#index'
  get 'logout', to: 'home#logout'
  get 'chats/:tg_id/count_tg_message', to: 'tg_chats#count_tg_message'

  telegram_webhook Telegram::WebhookController
  # post '/webhooks', to: 'webhooks#callback'
end
