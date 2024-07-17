module Telegram
  class WebhookController < Telegram::Bot::UpdatesController
    def check_admin?
      tg_id = from['id'].to_s
      admin = '232193762'

      true if tg_id == admin
    end

    def start!(*)
      if check_admin?
        chat_id = TgChat.find_or_create_by(tg_id: chat['id'])
        name = if chat['type'] == 'private'
                 chat['username']
               else
                 chat['title']
               end
        chat_id.name = name
        chat_id.status = true
        chat_id.tg_type = chat['type']
        chat_id.save!

        respond_with :message, text: "Начинаю считать сообщения"
      else
        respond_with :message, text: "Вы не можете использовать эту команду"
      end
    end

    def stats!(*)
      if check_admin?
        count_message = TgMessage.where(tg_chat_id: chat['id']).count
        respond_with :message, text: "В этом чате #{count_message} сообщений"
      else
        respond_with :message, text: "Вы не можете использовать эту команду"
      end
    end

    def userstats!(*args)
      if check_admin?
        respond_with :message, text: "Укажите имя пользователя" if args.empty?

        username = args[0].delete_prefix('@')
        user = TgUser.find_by(tg_name: username)

        if user
          user_message_count = TgMessage.where(tg_chat_id: chat['id'], tg_user_id: user.tg_id).count
          respond_with :message, text: "#{user.name} отправил #{user_message_count} сообщений"
        else
          respond_with :message, text: "#{user.name} еще ничего не отправил"
        end
      else
        respond_with :message, text: "Вы не можете использовать эту команду"
      end
    end

    def help!
      if check_admin?
        respond_with :message,
                     text: "/start запускает подсчет сообщений\n/stats показывает общее количество сообщений в чате\n/userstats @username показывает количество сообщний отдельного учатника чата"
      else
        respond_with :message, text: "Вы не можете использовать эту команду"
      end
    end

    def message(message)
      process_message(message)
    end

    private

    def process_message(message_params)
      if message_params
        tg_id = message_params['message_id']
        tg_chat_id = message_params.dig('chat', 'id')
        tg_user_id = message_params.dig('from', 'id')
        tg_chat = TgChat.find_by_tg_id(tg_chat_id)

        if tg_chat.status == true
          puts tg_chat.status
          if tg_id && tg_user_id
            user = TgUser.find_or_create_by(tg_id: tg_user_id) do |u|
              u.tg_name = message_params.dig('from', 'username')
              u.name = message_params.dig('from', 'first_name')
            end
            TgMessage.create!(tg_id:, tg_chat_id:, tg_user_id: user.tg_id)
          else
            Rails.logger.error("Нет параметра: #{message_params.inspect}")
          end
        end

      else
        Rails.logger.error("message_params is nil")
      end
    end
  end
end
