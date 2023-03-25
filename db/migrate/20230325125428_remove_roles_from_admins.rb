class RemoveRolesFromAdmins < ActiveRecord::Migration[7.0]
  def change
    remove_column :admins, :roles, :boolean
  end
end
