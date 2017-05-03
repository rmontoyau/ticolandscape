class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string	:key
      t.integer	:object_id
      t.integer	:object_type
      t.timestamps
    end
  end
end
