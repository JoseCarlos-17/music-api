require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'Attributes' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:country) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:artist_songs) }
    it { is_expected.to have_many(:songs).through(:artist_songs) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:country) }
  end
end
