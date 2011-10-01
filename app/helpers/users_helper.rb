# user management view helpers
module UsersHelper


  # display a thumbnail with the user avatar
  def avatar_thumb(user)
    prettyphoto_tag user.avatar_url(:thumb), user.avatar_url(:small), user
  end

end
