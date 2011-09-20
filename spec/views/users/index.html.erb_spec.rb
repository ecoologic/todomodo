require 'spec_helper'

describe 'users/index.html.erb' do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name  => 'Name',
        :about => ABOUT = 'about text',
        :note  =>  NOTE = 'note text',
      ),
      stub_model(User,
        :name  => 'Name',
        :about => ABOUT,
        :note  => NOTE,
      )
    ])
  end

  it 'renders a list of users' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'tr>td', :text => 'Name'.to_s, :count => 2
    assert_select 'tr>td', :text => ABOUT, :count => 2
    assert_select 'tr>td', :text => NOTE, :count => 2
  end
end
