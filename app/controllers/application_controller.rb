class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login, :name, :tg_user_id])
  end
end
