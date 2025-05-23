# frozen_string_literal: true

class Auth::SessionsController < DeviseTokenAuth::SessionsController
  before_action :configure_sign_in_params

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
