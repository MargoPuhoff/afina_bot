class HomeController < ApplicationController
  http_basic_authenticate_with name: "margo", password: "123123", except: [:logout]
  before_action :set_username, only: [:index]

  def index; end

  def logout
    reset_session
    redirect_to root_path
  end

  private

  def set_username
    session[:username] = 'Margo'
  end
end
