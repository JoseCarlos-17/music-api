require 'rails_helper'

RSpec.describe ArtistSong, type: :model do
  context 'Attributes' do
    it { is_expected.to have_db_column(:song_id) }
    it { is_expected.to have_db_column(:artist_id) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:artist) }
    it { is_expected.to belong_to(:song) }
  end
end
