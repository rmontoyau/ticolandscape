class CreateAlbumsPhotos < ActiveRecord::Migration[5.0]
  def change
  	create_table :albums_photos do |t|
	  	t.belongs_to :album, index: true
	  	t.belongs_to :photo, index: true
	  end
  end
end
