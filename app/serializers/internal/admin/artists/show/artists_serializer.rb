class Internal::Admin::Artists::Show::ArtistsSerializer < ActiveModel::Serializer
  attributes :id, :name, :country
end
