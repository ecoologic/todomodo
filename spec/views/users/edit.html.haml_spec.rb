require 'spec_helper'

describe "users/edit.html.haml" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name     => USER_NAME,
      :about    => USER_ABOUT,
      :note     => USER_NOTE,
      :avatar   => USER_AVATAR,
      :is_admin => false
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "put" do
      assert_select "input#user_name"    , :name => "user[name]"
      assert_select "textarea#user_about", :name => "user[about]"
      assert_select "input#user_avatar"  , :name => "user[avatar]"
    end
  end
end
