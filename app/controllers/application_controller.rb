class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_invalid(invalid)
    render json: { errors: invalid }, status: :unprocessable_entity
  end

  def record_not_found(not_found)
    render json: { errors: not_found }, status: :not_found
  end
end
