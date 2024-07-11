module Telegram
  class WebhookController < Telegram::Bot::UpdatesController
    def start!(*)
      chat_id = TgChat.find_or_create_by(tg_id: chat['id'])
      user_id = from['id']
      name = if chat['type'] == 'private'
               chat['username']
             else
               chat['title']
             end
      chat_id.name = name
      chat_id.save!

      respond_with :message, text: "Начинаю считать сообщения"
    end

    def stats!
      respond_with :message, text: "это команда будет показывать количество сообщений"
    end

    def userstats!
      respond_with :message, text: "Это команда будет показывать сообщения участника"
    end

    def help!
      respond_with :message, text: "Здесь будет справка по командам"
    end

    private

    def locale_for_update
      if from
        # locale for user
      elsif chat
        # locale for chat
      end
    end
  end
end
