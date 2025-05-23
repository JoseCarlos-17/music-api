require 'rails_helper'

RSpec.describe "Internal::Admin::Songs", type: :request do
  describe "POST#create" do
    context 'when the admin register the song' do
      let(:song_attributes) { attributes_for(:song,  title: 'Oitavo Andar',
        duration: '00:02:00', release_date: '2016-03-01') }
      
      before do
        post '/internal/admin/songs', params: { song: song_attributes }
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
        post '/internal/admin/songs', params: { song: song_invalid_attributes }
      end
  
      it 'must return 422 unprocessable_entity status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
