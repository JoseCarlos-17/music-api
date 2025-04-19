class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def record_invalid(invalid)
    render json: { errors: invalid }, status: :unprocessable_entity
  end
end
