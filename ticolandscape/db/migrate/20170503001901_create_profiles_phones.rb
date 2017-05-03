class CreateProfilesPhones < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles_phones do |t|
    	t.belongs_to :profile, index: true
	  	t.belongs_to :phone, index: true
    end
  end
end
