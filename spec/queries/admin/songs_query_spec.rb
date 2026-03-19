require 'rails_helper'

RSpec.describe "Admin::SongsQuery", type: :request do
  context 'when the query params is empty' do
    let!(:artist) { create(:artist, name: 'Pagan Babies') }
    let!(:song1) { create(:song, title: 'Bernadine') }
    let!(:song2) { create(:song, title: 'Best Sunday Dress') }
    let!(:artist_song1) { create(:artist_song,
      song_id: song1.id, artist_id: artist.id) }
    let!(:artist_song2) { create(:artist_song,
      song_id: song2.id, artist_id: artist.id) }

    let(:params) { { title: nil } }

    let(:result) { Admin::SongsQuery.new(params).call }

    before do
      result
    end

    it 'must return all songs' do
      expect(result.count).to eq(2)
    end
  end

  context 'when a song is search by title' do
    let!(:artist) { create(:artist, name: 'Pagan Babies') }
    let!(:song1) { create(:song, title: 'Bernadine') }
    let!(:song2) { create(:song, title: 'Best Sunday Dress') }
    let!(:song3) { create(:song, title: 'Love For Bernadine') }
    let!(:artist_song1) { create(:artist_song,
      song_id: song1.id, artist_id: artist.id) }
    let!(:artist_song2) { create(:artist_song,
      song_id: song2.id, artist_id: artist.id) }

    let(:params) { { title: "bernadine" } }

    let(:result) { Admin::SongsQuery.new(params).call }

    before do
      result
    end

    it 'must return all songs with Bernadine name' do
      expect(result[0][:title]).to eq("Bernadine")
      expect(result[1][:title]).to eq("Love For Bernadine")
    end
  end
end
