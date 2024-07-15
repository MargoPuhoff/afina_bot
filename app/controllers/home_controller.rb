class HomeController < ApplicationController
  http_basic_authenticate_with name: "margo", password: "123123", except: [:logout]
  before_action :set_username, only: [:index]

  def index
    @count_tg_message = TgMessage.count
    @users_with_message_count = TgUser.joins(:tg_messages)
                                      .select('tg_users.name, COUNT(tg_messages.tg_id) AS messages_count')
                                      .group('tg_users.tg_id')
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private

  def set_username
    session[:username] = 'Margo'
  end
end
