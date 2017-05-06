class CreateWebVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :web_visits do |t|
      t.string		:ip
      t.datetime	:date
      t.string		:page
      t.integer		:location_id
      t.timestamps
    end
  end
end
