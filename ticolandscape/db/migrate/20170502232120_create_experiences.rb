class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string 		:title
      t.datetime	:initial_date
      t.datetime	:final_date
      t.text		  :summary
      t.boolean 	:is_current, default: false
      t.integer		:profile_id
      t.timestamps
    end
  end
end
