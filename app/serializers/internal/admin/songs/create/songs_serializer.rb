class Internal::Admin::Songs::Create::SongsSerializer < ActiveModel::Serializer
  attributes :id, :title, :duration, :release_date
end
