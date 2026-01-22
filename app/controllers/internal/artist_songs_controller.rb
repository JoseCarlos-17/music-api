class Internal::ArtistSongsController < ApplicationController
  
  def create
    artist_song = ArtistSong.create!(artist_song_params)

    render json: artist_song,
           serializer: Internal::ArtistSongs::Create::ArtistSongSerializer,
           status: :created
  end

  private

  def artist_song_params
    params.require(:artist_song).permit(:artist_id, :song_id)
  end
end
