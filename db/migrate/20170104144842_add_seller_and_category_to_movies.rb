class AddSellerAndCategoryToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :seller_id,   :integer
    add_column :movies, :category_id, :integer

    add_index  :movies, :seller_id
    add_index  :movies, :category_id
  end
end
