module DeviseHelper

  # after this method you are logged in
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in Factory.create(:user)
  end

end


