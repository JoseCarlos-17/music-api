require 'rails_helper'

RSpec.describe "Internal::Songs", type: :request do
  describe 'GET#index' do
    context 'when songs are listed' do
      let!(:songs) { create_list(:song, 2) }

      before do
        get '/internal/songs'
      end

      it 'must return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return the first song attributes' do
        expect(json_body[0]).to include(:id, :title, :duration, :release_date)
      end
    end
  end

  describe 'POST#create' do
    context 'when the admin register the song' do
      let(:song_attributes) { attributes_for(:song,  title: 'Oitavo Andar',
        duration: '00:02:00', release_date: '2016-03-01') }
      
      before do
        post '/internal/songs', params: { song: song_attributes }
      end

      it 'must return 201 created status code' do
        expect(response).to have_http_status(:created)
      end

      it 'must return created song attributes' do
        expect(json_body).to include(:id, :title, :duration, :release_date)
      end
    end

    context "when the admin send invalid attributes" do
      let(:song_invalid_attributes) { attributes_for(:song,  title: nil,
        duration: nil, release_date: nil) }

      before do
        post '/internal/songs', params: { song: song_invalid_attributes }
      end
  
      it 'must return 422 unprocessable_entity status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT#update' do
    context 'when a song is updated by admin' do
      let!(:song) { create(:song) }
      let(:song_params) { attributes_for(:song, title: 'Oitavo Andar',
        duration: '00:02:00', release_date: '2016-03-01') }

      before do
        put "/internal/songs/#{song.id}",
        params: { song: song_params }
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'must update the song attributes' do
        expect(Song.last.title).to eq('Oitavo Andar')
      end
    end
  end

  describe 'GET#show' do
    context 'when a song is selected' do
      let(:song) { create(:song) }

      before do
        get "/internal/songs/#{song.id}"
      end

      it 'must to return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return song attributes' do
        expect(json_body).to include(:id, :title, :duration, :release_date)
      end
    end
  end

  describe 'DELETE#destroy' do
    context 'when a song is deleted' do
      let!(:song) { create(:song) }

      before do
        delete "/internal/songs/#{song.id}"
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'must delete the song above' do
        expect(Song.all.count).to eq(0)
      end
    end
  end
end
