class CreateSocialNets < ActiveRecord::Migration[5.0]
  def change
    create_table :social_nets do |t|
      t.string	:name
      t.string	:url
      t.integer :profile_id
      t.timestamps
    end
  end
end
