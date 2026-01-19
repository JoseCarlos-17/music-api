class Users::Show::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :profile_photo, :role

  def profile_photo
    object.profile_photo_url
  end
end
