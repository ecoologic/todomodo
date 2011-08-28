require 'spec_helper'

describe "Users" do
  describe "POST /user/session" do
    it "login and redirect to welcome page with flash message" do
      # init: create a new user
      user = Factory :user

      # actual login
      visit login_path
      fill_in 'user[email]'   , :with => user.email
      fill_in 'user[password]', :with => user.password
      click_button 'Sign in'

      # verification
      page.body.should include 'Signed in successfully'
      page.body.should include user.to_s
    end
  end
end
