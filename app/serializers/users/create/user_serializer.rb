class Users::Create::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :password_confirmation,
             :profile_photo

  def profile_photo
    object.profile_photo_url
  end
end
