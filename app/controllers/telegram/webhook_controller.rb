class Telegram::WebhookController < Telegram::Bot::UpdatesController
  def stats!
    respond_with :message, text: "это команда будет показывать количество сообщений"
  end

  def userstats!
    respond_with :message, text: "Это команда будет показывать сообщения участника"
  end

  def start!(*)
    respond_with :message, text: "Начинаю считать сообщения"
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
