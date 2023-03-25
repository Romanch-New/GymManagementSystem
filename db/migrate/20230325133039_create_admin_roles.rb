class CreateAdminRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_roles do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :roles, null: false, foreign_key: true

      t.timestamps
    end

    add_index :admin_roles, [:admin_id, :roles_id], unique: true
  end
end
