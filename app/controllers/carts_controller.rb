class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart_movies = current_user.bought_movies
    @count = @cart_movies.where('movies.count_of_copies > 0').count
  end

  def buy
    @cart_movies = current_user.bought_movies.where('movies.count_of_copies > 0')
    @cart_movies.each do |movie|
      current_user.carts.find_by(movie_id: movie.id).update_attributes paid: true
      movie.update_attributes count_of_copies: movie.count_of_copies - 1
    end
    flash[:notice] = 'Successfully Bought'
    redirect_to cart_path
  end

  def add
    current_user.carts.create movie_id: params[:movie_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    current_user.carts.find_by(movie_id: params[:movie_id]).destroy
    render json: current_user.cart_count, status: 200
  end

end
