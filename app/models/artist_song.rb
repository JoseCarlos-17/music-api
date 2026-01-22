class ArtistSong < ApplicationRecord
  belongs_to :song
  belongs_to :artist

  validates :artist, :song, presence: true
end
