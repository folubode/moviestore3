class MoviesController < ApplicationController
  before_action :should_be_seller, only: [:new, :create]

  def index
    @movies = Movie.paginate page: params[:page], per_page: per_page
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create movie_params
    redirect_to movie_path @movie.id
  end

  def show
    @movie = Movie.find(params[:id])
    @cart_action = @movie.cart_action current_user.try :id
    commontator_thread_show @movie
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes movie_params
    redirect_to movie_path(params[:id])
  end

  def destroy
    @movie = Movie.find params[:id]
    if !current_user
      flash[:alert] = 'Please Sign In'
      redirect_to new_user_session_path
    elsif current_user.role.deleting == 0 || (current_user.role.deleting == 1 && @movie.seller_id != current_user.id)
      flash[:alert] = 'Forbidden'
      return redirect_to root_path
    end
    @movie.destroy
    redirect_to root_path
  end

  def rest
    @movies = Movie.all
  end

  def change_count
    @movie = Movie.find params[:id]
    @movie.update_attributes count_of_copies: params[:count]
    render json: { status: true, id: @movie.id, count: @movie.count_of_copies }
  end

  private
  def should_be_seller
    if !current_user
      flash[:alert] = 'Please Sign In'
      redirect_to new_user_session_path
    #elsif current_user.role.creating == 0
    elsif current_user.role_id == 0
      flash[:alert] = 'Forbidden'
      redirect_to root_path
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :release_year, :price, :description, :imdb_id, :poster_url, :seller_id, :count_of_copies, :thrailer_url)
  end

  def per_page
    params[:per_page] || 12
  end
end
