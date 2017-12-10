class AddDefaultToPosterUrlAndRenameCountToCountOfCopiesOnMovies < ActiveRecord::Migration[5.0]
  def change
    change_column_default :movies, :poster_url, '/default_poster.jpg'
    rename_column :movies, :count, :count_of_copies
  end
end
