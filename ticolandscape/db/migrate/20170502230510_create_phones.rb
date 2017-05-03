class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :ext
      t.integer :phone_type_id
      t.timestamps
    end
  end
end
