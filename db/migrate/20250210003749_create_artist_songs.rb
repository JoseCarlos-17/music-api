class CreateArtistSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :artist_songs do |t|
      t.references :song, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
