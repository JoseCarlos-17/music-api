require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'Attributes' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:country) }
  end
end
