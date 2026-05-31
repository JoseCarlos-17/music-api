require 'rails_helper'

RSpec.describe "Artists", type: :request do
  let!(:photo) { fixture_file_upload("app/assets/cover.png", "file/png") }

  describe 'GET#index' do
    context 'when artists are listed' do
      let!(:artist_list) { create_list(:artist, 2, profile_photo: photo) }

      before do
        get '/artists'
      end

      it 'must render 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return the first artist attributes' do
        expect(json_body[0]).to include(:id, :name, :country)
      end
    end
  end

  describe 'GET#show' do
    context 'when an artist is selected from the list' do
      let!(:artist) { create(:artist, profile_photo: photo) }

      before do
        get "/artists/#{artist.id}"
      end

      it 'must render 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return selected artist attributes' do
        expect(json_body).to include(:id, :name, :country)
      end
    end
  end
end
