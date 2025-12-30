class Internal::Admin::Artists::Index::ArtistsSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :profile_photo

  def profile_photo
    object.profile_photo_url
  end
end
