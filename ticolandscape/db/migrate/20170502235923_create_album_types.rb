class CreateAlbumTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :album_types do |t|
      t.string :key
      t.timestamps
    end
  end
end
