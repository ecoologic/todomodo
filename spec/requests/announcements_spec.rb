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


# without loading factory
describe "Without announcements in layout" do
  it "should work when there are no current announcements" do
    visit root_path
    page.body.should have_content 'Welcome'
  end
end


describe "Announcements in layout" do
  before(:each) do
    @pasts    = []
    @currents = []
    @futures  = []

    TIMES.times do |n|
      @pasts    << Factory(:past_announcement   , :message => "past announcement #{n}")
      @currents << Factory(:current_announcement, :message => "current announcement #{n}")
      @futures  << Factory(:future_announcement , :message => "future announcement #{n}")
    end

    @all = @pasts + @currents + @futures
    
  end

  describe "never been hidden" do
    
    before(:each) do
      visit root_path
    end

    it "should show current announcements" do
      @currents.each {|a| page.body.should have_content a.message}
    end
    
    it "should not show pasts announcements" do
      @pasts.each {|a| page.body.should_not have_content a.message}
    end
    
    it "should not show future announcements" do
      @futures.each {|a| page.body.should_not have_content a.message }
    end
    
    it "should hide all announcements when hide link is clicked", :js => true
    # TODO: hide not found, relates to :js => true??
    #  do
    #   visit root_path
    #   click_link 'Hide'
    #   page.body.should have_content 'Welcome'
    #   @all.each {|a| page.body.should_not have_content a.message}
    # end

  end


  describe "hide pressed" do

    before(:each) do
      get hide_current_announcements_path, :format => :js
      @just_updated = @currents.first
      @just_updated.update_attribute(:message, 'Just updated announcement')
      @just_created = Factory(:current_announcement,
                              :message => 'Just created announcement')
      visit root_path
    end

    it "should not show any previously hidden announcement" do
      @currents.each do |a|
        puts "#{a.message}: start/end #{a.starts_at.class.to_s} #{a.starts_at} #{Time.now} #{a.ends_at} || #{@request.session.to_s}"
        page.body.should_not have_content a.message unless a == @just_updated
      end
    end

    it "should show an announcement updated after hide time" do
      page.body.should have_content @just_updated.message
    end
    
    it "should show an announcement created after hide time" do
      page.body.should have_content @just_created.message
    end
  end

end


