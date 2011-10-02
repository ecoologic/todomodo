require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name     => USER_NAME,
      :about    => USER_ABOUT,
      :avatar   => USER_AVATAR
    ))
  end

  it "renders selected attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers

    # rendered.should match(/#{@user}/)
    rendered.should match(/#{USER_ABOUT}/)
    # TODO: rendered.should match(/Avatar/)
  end
end
