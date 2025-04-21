class Internal::Admin::SongsController < ApplicationController
  def create
    song = { message: 'create song endpoint called' }

    render json: song, status: :created
  end
end
