class AddBuyingToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :buying, :integer # 0 - no, 1 - yes
  end
end
