require 'rails_helper'

RSpec.describe Song, type: :model do
  context 'Attributes' do
    it { is_expected.to have_db_column(:title) }
    it { is_expected.to have_db_column(:release_date) }
    it { is_expected.to have_db_column(:duration) }
    it { is_expected.to have_db_column(:file_url) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:artist_songs) }
    it { is_expected.to have_many(:artists).through(:artist_songs) }
  end
end
