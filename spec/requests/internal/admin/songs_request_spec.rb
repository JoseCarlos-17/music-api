require 'rails_helper'

RSpec.describe "Internal::Admin::Songs", type: :request do
  describe "POST#create" do
    context 'when the admin register the song' do
      let(:song_attributes) { attributes_for(:song,  title: 'Oitavo Andar',
        duration: '00:02:00', release_date: '2016-03-01') }
      
      before do
        post '/internal/admin/songs'
      end

      it 'must return 201 created status code' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
