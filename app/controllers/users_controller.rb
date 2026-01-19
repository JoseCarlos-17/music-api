class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show update destroy]
  skip_after_action :update_auth_header, only: %i[destroy]
 
  def create
    user = User.create!(user_params)
    
    render json: user,
           serializer: Users::Create::UserSerializer,
           status: :created
  end

  def show
    user = current_user

    render json: user,
           serializer: Users::Create::UserSerializer,
           status: :ok
  end

  def update
    user = current_user

    user.update(user_params)

    head :no_content
  end

  def destroy
    user = current_user

    user.destroy!

    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :role,
                                 :password_confirmation, :profile_photo)
  end
end
