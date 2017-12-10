class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts, -> { where paid: false }
  has_many :paid_carts, -> { where paid: true }, class_name: 'Cart'

  has_many :bought_movies, through: :carts, source: :movie
  has_many :paid_movies, through: :paid_carts, source: :movie, class_name: 'Movie'

  has_many :sold_movies, class_name: 'Movie', foreign_key: :seller_id

  belongs_to :role

  acts_as_commenter

  def cart_count
    bought_movies.count
  end

  def role_name
    role.name
  end

  def path
    if self.sold_movies.count > 0
      "/users/#{self.id}/movies"
    else
      nil
    end
  end
end
