module UsersHelper
  def user_path(user_id)
    user = User.find user_id
    if user.sold_movies.count > 0
      movies_user_path(user.id)
    else
      ''
    end
  end
end
