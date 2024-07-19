Rails.application.routes.draw do
  resources :tg_commands
  devise_for :users
  resources :tg_users
  resources :tg_messages

  resources :tg_chats, only: [] do
    member do
      patch :change_status
    end
  end

  root 'home#index'
  get 'logout', to: 'home#logout'
  get 'chats/:tg_id/count_tg_message', to: 'tg_chats#count_tg_message'

  telegram_webhook Telegram::WebhookController
  # post '/webhooks', to: 'webhooks#callback'
end
