class Internal::SongsController < ApplicationController
  def index
    songs = Song.all

    render json: songs,
           each_serializer: Internal::Songs::Index::SongsSerializer,
           status: :ok
  end
  
  def create
    song = Song.create!(song_attributes)

    render json: song,
           serializer: Internal::Songs::Create::SongsSerializer,
           status: :created
  end

  def update
    song = Song.find(params[:id])

    song.update(song_attributes)

    head :no_content
  end

  def show
    song = Song.find(params[:id])

    render json: song,
           serializer: Internal::Songs::Show::SongsSerializer,
           status: :ok
  end

  def destroy
    song = Song.find(params[:id])

    song.destroy!

    head :no_content
  end

  private

  def song_attributes
    params.require(:song).permit(:title, :duration, :release_date)
  end
end
