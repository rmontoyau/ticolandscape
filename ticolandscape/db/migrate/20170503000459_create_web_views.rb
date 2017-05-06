class CreateWebViews < ActiveRecord::Migration[5.0]
  def change
    create_table :web_views do |t|
      t.integer :object_id
      t.string	:object_type
      t.integer	:views
      t.timestamps
    end
  end
end
