# frozen_string_literal: true

class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_sign_up_params
 
  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password, :email, :password_confirmation])
  end
end
