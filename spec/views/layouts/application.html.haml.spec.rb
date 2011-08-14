require 'spec_helper'

describe "layouts/application.html.haml" do
  before(:each) do
    @past    = []
    @current = []
    @future  = []
    
    2.times do
      @past    << Factory(:past_announcement)
      @current << Factory(:current_announcement)
      @future  << Factory(:future_announcement)
    end
    
  end

  it "should shows current announcements" do
    visit root_path
    @current.each do |a|
      page.should have_content a.message
    end
    nil.should be 5
  end
  
  it "should not shows past announcements" do
    visit root_path
    @past.each do |a|
      page.should_not have_content a.message
    end
  end
  
  it "should not shows future announcements" do
    visit root_path
    @future.each do |a|
      page.should_not have_content a.message
    end
  end
  
  
end
