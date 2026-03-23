class AddIndexToSongTitle < ActiveRecord::Migration[7.1]
  def change
    add_index :songs, "REPLACE(LOWER(title), ' ', '')", name: "index_to_song_title"
  end
end
