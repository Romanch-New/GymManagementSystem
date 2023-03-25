# create class for CreateRoles migration
# rails g migration AddRolesToUsers roles:references
# rails db:migrate

class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
