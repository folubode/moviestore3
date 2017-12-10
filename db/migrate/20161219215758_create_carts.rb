class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :movie_id
      t.timestamps
    end
    add_index :carts, [:user_id, :movie_id], unique: true
    add_index :carts, :user_id
    add_index :carts, :movie_id
  end
end
