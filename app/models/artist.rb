class Artist < ApplicationRecord
  has_many :artist_songs
  has_many :songs, through: :artist_songs

  validates :name, :country, presence: true
  
  has_one_attached :profile_photo
end
