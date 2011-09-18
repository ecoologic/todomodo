require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :about => "MyText",
      :note => "MyText",
      :avatar => "MyString",
      :is_admin => false
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "textarea#user_about", :name => "user[about]"
      assert_select "textarea#user_note", :name => "user[note]"
      assert_select "input#user_avatar", :name => "user[avatar]"
      assert_select "input#user_is_admin", :name => "user[is_admin]"
    end
  end
end
