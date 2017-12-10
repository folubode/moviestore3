class AddCountToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :count, :integer
  end
end
