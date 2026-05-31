class ArtistsController < ApplicationController
  def index
    artists = Artist.all

    render json: artists,
           each_serializer: Artists::Index::ArtistsSerializer,
           status: :ok
  end

  def show
    artist = Artist.find(params[:id])

    render json: artist,
           serializer: Artists::Show::ArtistsSerializer,
           status: :ok
  end
end
