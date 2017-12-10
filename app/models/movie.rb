class Movie < ApplicationRecord
  has_many :carts, inverse_of: :movie
  has_many :users, through: :carts

  belongs_to :seller, class_name: 'User', inverse_of: :sold_movies

  acts_as_commentable

  def poster
    poster_url
  end

  def imdb
    "http://www.imdb.com/title/#{imdb_id}/"
  end

  # def thrailer_url
  #   self.link.split('/').last if self.link
  # end

  def cart_action(current_user_id)
    user = users.find_by id: current_user_id
    if user
      'Remove from'
    else
      'Add to'
    end
  end
end
