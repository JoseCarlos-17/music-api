require 'rails_helper'

RSpec.describe "Internal::Artists", type: :request do
  let!(:photo) { fixture_file_upload("app/assets/cover.png", "file/png") }
  describe 'GET#index' do
    context 'when artists are listed' do
      let!(:artist_list) { create_list(:artist, 2, profile_photo: photo) }

      before do
        get '/internal/artists'
      end

      it 'must render 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return the first artist attributes' do
        expect(json_body[0]).to include(:id, :name, :country)
      end
    end
  end

  describe "POST#create" do
    context 'when a artist is created by an admin' do
      let(:artist_params) { attributes_for(:artist, name: 'John Doe',
        country: 'United States', profile_photo: photo) }
      before do
        post '/internal/artists', params: { artist: artist_params }
      end

      it 'status code must to be 201 created' do
        expect(response).to have_http_status(:created)
      end

      it 'must return the artist created attributes' do
        expect(json_body).to include(:id, :name, :country)
      end
    end

    context 'when admin pass invalid params' do
      let(:invalid_artist_params) { attributes_for(:artist, name: nil,
      country: nil) }

      before do
        post '/internal/artists',
        params: { artist: invalid_artist_params }
      end

      it 'status code must to be 422 unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return invalid attributes errors' do
        expect(json_body).to include(:errors)
      end
    end
  end

  describe 'PUT#update' do
    context 'when admin updates the artist' do
      let!(:artist) { create(:artist, name: 'John Doe', profile_photo: photo) }
      let(:artist_params) { attributes_for(:artist, name: 'Jake Doe') }

      before do
        put "/internal/artists/#{artist.id}",
        params: { artist: artist_params }
      end

      it 'must to return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'the artist name need to change for Jake Doe' do
        expect(Artist.first.name).to eq('Jake Doe')
      end
    end
  end

  describe 'GET#show' do
    context 'when an admin select an artist of list' do
      let!(:artist) { create(:artist, profile_photo: photo) }

      before do
        get "/internal/artists/#{artist.id}"
      end

      it 'must render 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return selected artist attributes' do
        expect(json_body).to include(:id, :name, :country)
      end
    end
  end

  describe 'DELETE#Destroy' do
    context 'when an admin delete an artist' do
      let!(:artist) { create(:artist, profile_photo: photo) }

      before do
        delete "/internal/artists/#{artist.id}"
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'artist must to be deleted' do
        expect(Artist.count).to eq(0)
      end
    end
  end
end
