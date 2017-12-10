class RenameUsersToUserControlOnRoles < ActiveRecord::Migration[5.0]
  def change
    rename_column :roles, :users, :user_control
  end
end
