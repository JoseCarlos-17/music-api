class Internal::ArtistSongsController < ApplicationController
  def index
    artist_songs = ArtistSong.includes(:artist, :song)

    render json: artist_songs,
           each_serializer: Internal::ArtistSongs::Index::ArtistSongSerializer,
           status: :ok
  end

  def create
    artist_song = ArtistSong.create!(artist_song_params)

    render json: artist_song,
           serializer: Internal::ArtistSongs::Create::ArtistSongSerializer,
           status: :created
  end

  def update
    artist_song = ArtistSong.find(params[:id])

    artist_song.update(artist_song_params)

    head :no_content
  end

  def show
    artist_song = ArtistSong.find(params[:id])

    render json: artist_song,
           serializer: Internal::ArtistSongs::Show::ArtistSongSerializer,
           status: :ok
  end

  def destroy
    artist_song = ArtistSong.find(params[:id])

    artist_song.destroy!

    head :no_content
  end

  private

  def artist_song_params
    params.require(:artist_song).permit(:artist_id, :song_id)
  end
end
