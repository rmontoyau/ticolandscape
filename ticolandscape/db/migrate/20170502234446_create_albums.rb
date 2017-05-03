class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string	:title
      t.text	:description
      t.integer	:user_id
      t.integer	:album_type_id
      t.integer	:location_id
      t.timestamps
    end
  end
end
