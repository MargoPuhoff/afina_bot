class Telegram::WebhookController < Telegram::Bot::UpdatesController
  def message(message)
    # store_message(message['text'])
  end

  def start!(word = nil, *other_words)
    response = from ? "Hello #{from['username']}!" : 'Hi there!'

    respond_with :message, text: response
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
