class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:about, :top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #サインイン後の遷移先に設定
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource) #サインアウト後の遷移先を設定
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end
end