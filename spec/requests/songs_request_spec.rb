require 'rails_helper'

RSpec.describe "Songs", type: :request do
  describe 'GET#index' do
    context 'when songs are listed' do
      let!(:song_list) { create_list(:song, 2) }

      before do
        get '/songs'
      end

      it 'must render 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return the first song attributes' do
        expect(json_body[0]).to include(:id, :title, :duration, :release_date, :file_url)
      end
    end
  end

  describe 'GET#show' do
    context 'when a song is selected from the list' do
      let!(:song) { create(:song) }

      before do
        get "/songs/#{song.id}"
      end

      it 'must render 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return selected song attributes' do
        expect(json_body).to include(:id, :title, :duration, :release_date, :file_url)
      end
    end
  end
end
