class Internal::Admin::Songs::Show::SongsSerializer < ActiveModel::Serializer
  attributes :id, :title, :duration, :release_date
end
