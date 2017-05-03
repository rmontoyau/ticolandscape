class CreateTools < ActiveRecord::Migration[5.0]
  def change
    create_table :tools do |t|
      t.string	:name
      t.integer	:percent
      t.integer	:profile_id
      t.timestamps
    end
  end
end
