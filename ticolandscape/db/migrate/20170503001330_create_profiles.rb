class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer		:user_id
      t.string 	  :name      
      t.string 		:last_name
      t.string    :position
      t.date      :dob
      t.text 	  	:about_me
      t.string		:sex
      t.integer		:photo_id      
      t.integer		:location_id
      t.integer   :phone
      t.timestamps
    end
  end
end
