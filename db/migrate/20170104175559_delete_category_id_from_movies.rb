class DeleteCategoryIdFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :category_id
  end
end
