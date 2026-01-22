require 'rails_helper'

RSpec.describe 'Internal::ArtistSongs', type: :request do
  describe 'POST#create' do
    context 'when an artist song is created' do
      let!(:artist) { create(:artist) }
      let!(:song) { create(:song) }

      let(:artist_song_params) { attributes_for(:artist_song,
        artist_id: artist.id, song_id: song.id) }

      before do
        post '/internal/artist_songs',
        params: { artist_song: artist_song_params }
      end

      it 'must return 201 status code' do
        expect(response).to have_http_status(:created)
      end

      it 'must return artist_song attributes' do
        expect(json_body).to include(:id, :artist, :song)
      end

      it 'must return artist attributes' do
        expect(json_body[:artist]).to include(:id, :name, :country)
      end

      it 'must return song attributes' do
        expect(json_body[:song]).to include(:id, :title, :duration,
                                            :release_date, :file_url)
      end
    end

    context 'when an artist song is not created' do
      let!(:artist) { create(:artist) }
      let!(:song) { create(:song) }

      let(:artist_song_invalid_params) { attributes_for(:artist_song,
        artist_id: artist.id, song_id: nil) }

      before do
        post '/internal/artist_songs',
        params: { artist_song: artist_song_invalid_params }
      end

      it 'must return 422 status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return error message' do
        expect(json_body).to have_key(:errors)
      end
    end
  end
end
