class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string	:image
      t.string	:title
      t.text 	  :description
      t.integer	:location_id
      t.boolean :is_cover, default: false
      t.integer	:photo_type_id
      t.timestamps
    end
  end
end
