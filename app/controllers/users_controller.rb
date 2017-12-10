class UsersController < ApplicationController
  def index
    @users = User.all
    @roles = Role.all
  end

#  def show
#    @user = User.find params[:id]
#    @movies = @user.sold_movies
#  end

  def movies
    @user = User.find params[:id]
    @movies = @user.sold_movies.paginate page: params[:page], per_page: per_page
  end

  private
  def per_page
    params[:per_page] || 12
  end
end
