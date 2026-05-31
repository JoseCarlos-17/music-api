class SongsController < ApplicationController
  def index
    songs = Song.all

    render json: songs,
           each_serializer: Songs::Index::SongsSerializer,
           status: :ok
  end

  def show
    song = Song.find(params[:id])

    render json: song,
           serializer: Songs::Show::SongsSerializer,
           status: :ok
  end
end
