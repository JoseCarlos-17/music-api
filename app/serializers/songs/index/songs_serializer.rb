class Songs::Index::SongsSerializer < ActiveModel::Serializer
  attributes :id, :title, :duration, :release_date, :file_url
end
