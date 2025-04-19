class Internal::Admin::ArtistsController < ApplicationController
  def create
    artist = Artist.create!(artist_params)

    render json: artist,
           serializer: Internal::Admin::Artists::Create::ArtistsSerializer,
           status: :created
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :country)
  end
end
