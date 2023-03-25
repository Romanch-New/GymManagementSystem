class RemoveAdminIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin_id, :bigint
  end
end
