class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.time :duration
      t.date :release_date
      t.string :file_url

      t.timestamps
    end
  end
end
