class ArtistsController < ApplicationController
  def index
    artists = Artist.all

    render json: artists,
           each_serializer: Artists::Index::ArtistsSerializer,
           status: :ok
  end
end
