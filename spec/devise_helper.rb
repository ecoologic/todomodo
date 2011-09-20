module DeviseHelper

  # after this method you are logged in
  def login_user
    @request.env['devise.mapping'] = Devise.mappings[:user]
    current_user = Factory.create(:user)
    sign_in current_user
    current_user
  end

  # after this method you are logged out
  def logout_user
    # TODO: none working...
    @request.env.delete 'devise.mapping'
    @request.session.delete 'warden.user.user.key'
    # get logout_path
  end

end


