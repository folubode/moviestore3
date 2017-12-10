class AddUsersToRolesAndChangeRoleDefaultOnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :users, :integer # 0 - no,
                                        # 1 - block and delete users,
                                        # 2 - change roles
    change_column_default :users, :role_id, 1
  end
end
