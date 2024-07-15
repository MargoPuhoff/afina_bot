class HomeController < ApplicationController
  http_basic_authenticate_with name: "margo", password: "123123"
  def index; end
end
