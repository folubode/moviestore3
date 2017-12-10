class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role_id, :integer, default: 0 # 0 - user, 1 - customer, 2 - moderator, 2 - administrator
    add_index :users, :role_id
  end
end
