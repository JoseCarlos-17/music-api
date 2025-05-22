class Internal::Admin::SongsController < ApplicationController
  def create
    song = Song.create!(song_attributes)

    render json: song,
           serializer: Internal::Admin::Songs::Create::SongsSerializer,
           status: :created
  end

  private

  def song_attributes
    params.require(:song).permit(:title, :duration, :release_date)
  end
end
