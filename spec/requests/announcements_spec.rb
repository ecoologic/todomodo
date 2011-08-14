require 'spec_helper'

describe "CRUD Announcements" do
  describe "GET /announcements" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get announcements_path
      response.status.should be(200)
    end
  end
end


describe "announcements in layout" do
  before(:each) do
    @pasts    = []
    @currents = []
    @futures  = []
    
    4.times do
      @pasts    << Factory(:past_announcement)
      @currents << Factory(:current_announcement)
      @futures  << Factory(:future_announcement)
    end

    @all = @pasts + @currents + @futures
    
    visit root_path
  end

  it "should shows currents announcements" do
    @currents.each {|a| page.should have_content a.message}
  end
  
  it "should not shows pasts announcements" do
    @pasts.each {|a| page.should_not have_content a.message}
  end
  
  it "should not shows future announcements" do
    @futures.each {|a| page.should_not have_content a.message }
  end
  
  it "should hide all announcements when hide link is clicked", :js => true do
    # TODO: supoport js for:
    click_link 'Hide'
    page.should have_content 'Welcome'
    @all.each {|a| page.should_not have_content a.message}
  end
  
end

