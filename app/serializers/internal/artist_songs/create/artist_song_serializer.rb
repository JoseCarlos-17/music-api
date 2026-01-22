class Internal::ArtistSongs::Create::ArtistSongSerializer < ActiveModel::Serializer
  attributes :id, :artist, :song

  def artist
    {
      id: object.artist.id,
      name: object.artist.name,
      country: object.artist.country,
    }
  end

  def song
    {
      id: object.song.id,
      title: object.song.title,
      duration: object.song.duration,
      release_date: object.song.release_date,
      file_url: object.song.file_url
    }
  end
end
