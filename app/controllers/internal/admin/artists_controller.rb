class Internal::Admin::ArtistsController < ApplicationController
  def index
    artists = Artist.all

    render json: artists,
           each_serializer: Internal::Admin::Artists::Index::ArtistsSerializer,
           status: :ok
  end

  def create
    artist = Artist.create!(artist_params)

    render json: artist,
           serializer: Internal::Admin::Artists::Create::ArtistsSerializer,
           status: :created
  end

  def update
    artist = Artist.find(params[:id])

    artist.update(artist_params)

    head :no_content
  end

  def show
    artist = Artist.find(params[:id])

    render json: artist,
           serializer: Internal::Admin::Artists::Show::ArtistsSerializer,
           status: :ok
  end

  def destroy
    artist = Artist.find(params[:id])

    artist.destroy!

    head :no_content
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :country, :profile_photo)
  end
end
