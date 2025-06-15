class Internal::Admin::SongsController < ApplicationController
  def create
    song = Song.create!(song_attributes)

    render json: song,
           serializer: Internal::Admin::Songs::Create::SongsSerializer,
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
           serializer: Internal::Admin::Songs::Show::SongsSerializer,
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
