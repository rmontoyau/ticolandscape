class CreatePhotoTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_types do |t|
      t.string :key
      t.timestamps
    end
  end
end
