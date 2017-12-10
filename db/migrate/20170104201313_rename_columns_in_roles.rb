class RenameColumnsInRoles < ActiveRecord::Migration[5.0]
  def change
    rename_column :roles, :delete,  :deleting
    rename_column :roles, :update,  :updating
    rename_column :roles, :create,  :creating
    rename_column :roles, :comment, :commenting
  end
end
