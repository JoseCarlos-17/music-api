class AddIndexToSongTitle < ActiveRecord::Migration[7.1]
  def change
    add_index :songs, :title, opclass: :text_pattern_ops
  end
end
