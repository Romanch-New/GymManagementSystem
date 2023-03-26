# frozen_string_literal: true

# create class for CreateRoles migration
# rails g migration AddRolesToUsers roles:references
# rails db:migrate

class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    # Set enum for roles
    add_column :users, :role, :integer, default: 0
    add_index :users, :role

    # Create default roles
    Role.create(name: 'user')
    Role.create(name: 'admin')
    Role.create(name: 'super_admin')
    Role.create(name: 'coach')
  end
end
