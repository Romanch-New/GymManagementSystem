class AddRolesToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :roles, :boolean
  end
end
