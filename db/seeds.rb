# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development? || Rails.env.production?
  artist1 = Artist.find_or_create_by(name: "Eddie Vedder", country: "USA")
  artist2 = Artist.find_or_create_by(name: "Courtney Love", country: "USA")

  song1 = Song.find_or_create_by(title: "Porch", duration: "3:30", release_date: "1991-08-27")
  song2 = Song.find_or_create_by(title: "Good Sister/Bad Sister", duration: "5:47", release_date: "1991-09-17")

  ArtistSong.find_or_create_by(artist_id: artist1.id, song_id: song1.id)
  ArtistSong.find_or_create_by(artist_id: artist2.id, song_id: song2.id)
end
