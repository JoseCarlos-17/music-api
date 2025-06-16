class Internal::Admin::Songs::Index::SongsSerializer < ActiveModel::Serializer
  attributes :id, :title, :duration, :release_date
end
