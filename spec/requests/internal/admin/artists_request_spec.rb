require 'rails_helper'

RSpec.describe "Internal::Admin::Artists", type: :request do
  describe "POST#create" do
    context 'when a artist is created by an admin' do
      let(:artist_params) { attributes_for(:artist, name: 'John Doe',
        country: 'United States') }
      
      before do
        post '/internal/admin/artists', params: { artist: artist_params }
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
        post '/internal/admin/artists',
        params: { artist: invalid_artist_params }
      end

      it 'status code must to be 422 unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return message errors' do
        expect(json_body).to include(:errors)
      end
    end
  end

  describe 'PUT#update' do
    context 'when admin updates the artist' do
      let!(:artist) { create(:artist, name: 'John Doe') }
      let(:artist_params) { attributes_for(:artist, name: 'Jake Doe') }

      before do
        put "/internal/admin/artists/#{artist.id}",
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
end
