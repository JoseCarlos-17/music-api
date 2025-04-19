class Internal::Admin::Artists::Create::ArtistsSerializer < ActiveModel::Serializer
  attributes :id, :name, :country
end
