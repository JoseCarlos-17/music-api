class Internal::Admin::Artists::Index::ArtistsSerializer < ActiveModel::Serializer
  attributes :id, :name, :country
end
