class AddPaidToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :paid, :boolean, default: false
  end
end
