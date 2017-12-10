class AddThrailerUrlToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :thrailer_url, :string
  end
end
