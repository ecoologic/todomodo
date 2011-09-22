require 'spec_helper'

describe 'users/index.html.erb' do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name  => USER_NAME,
        :about => USER_ABOUT,
        :note  => USER_NOTE,
      ),
      stub_model(User,
        :name  => USER_NAME,
        :about => USER_ABOUT,
        :note  => USER_NOTE,
      )
    ])
  end

  it 'renders a list of users' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'tr>td', :text => USER_NAME , :count => 2
    assert_select 'tr>td', :text => USER_ABOUT, :count => 2
    assert_select 'tr>td', :text => USER_NOTE , :count => 2
  end
end
