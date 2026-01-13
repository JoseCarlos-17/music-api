class Artist < ApplicationRecord
  has_many :artist_songs
  has_many :songs, through: :artist_songs

  validates :name, :country, presence: true
  
  has_one_attached :profile_photo

  def profile_photo_url
    "#{ENV['BASE_URL']}#{rails_blob_path(self.profile_photo, only_path: true)}" if self.profile_photo.attached?
  end
end
