class CreateRolesPermissions < ActiveRecord::Migration[5.0]
  def change
  	create_table :roles_permissions do |t|
	  	t.belongs_to :role, index: true
	  	t.belongs_to :permission, index: true
	  end
  end
end
