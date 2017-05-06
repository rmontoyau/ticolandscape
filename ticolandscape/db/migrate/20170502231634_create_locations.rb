class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string 	:country
      t.string	:state
      t.string	:department
      t.string	:city
      t.integer	:latitude
      t.integer :longitude
      t.timestamps
    end
  end
end
