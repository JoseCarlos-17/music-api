require 'rails_helper'

RSpec.describe Song, type: :model do
  context 'attributes' do
    it { is_expected.to have_db_column(:title) }
    it { is_expected.to have_db_column(:release_date) }
    it { is_expected.to have_db_column(:duration) }
    it { is_expected.to have_db_column(:file_url) }
  end
end
