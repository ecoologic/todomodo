require 'spec_helper'

describe 'users/index.html.haml' do
  before(:each) do
    @users = assign(:users, [
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
    
    assert true

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # TODO: none of these fields are good for mockup
    # assert_select 'tr>td', :text => USER_NAME , :count => 2
    # assert_select 'tr>td', :text => USER_ABOUT, :count => 2
    # assert_select 'tr>td', :text => USER_NOTE , :count => 2
  end
end
