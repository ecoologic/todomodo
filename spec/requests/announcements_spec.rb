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


describe "Announcements in layout", :js => true do
  before(:each) do
    puts "announcements in layout vvvvvvvvvvvvvvvvvvvvvvvvvvv"
    @pasts    = []
    @currents = []
    @futures  = []

    TIMES.times do |n|
      @pasts    << Factory(:past_announcement   , :message => "past announcement #{n}")
      @currents << Factory(:current_announcement, :message => "current announcement #{n}")
      @futures  << Factory(:future_announcement , :message => "future announcement #{n}")
    end

    @all = @pasts + @currents + @futures
    puts "announcements in layout ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
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
    
    it "should hide all announcements when hide link is clicked"
    # , :js => true TODO: hide not found, relates to :js => true
    #  do
    #   visit root_path
    #   click_link 'Hide'
    #   page.body.should have_content 'Welcome'
    #   @all.each {|a| page.body.should_not have_content a.message}
    # end

  end


  describe "hide pressed", :js => true do

    before(:each) do
      puts "hide pressed vvvvvvvvvvvvvvvvvvvvvvvvvvvv"
      visit root_path
      # get hide_current_announcements_path, :format => :js
      click_link 'hide'
      @just_updated = @currents.first
      @just_updated.update_attribute(:message, 'Just updated announcement')
      @just_created = Factory(:current_announcement,
                              :message => 'Just created announcement')
      puts "hide pressed ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    end

    it "should not show any previously hidden announcement" do
      puts "Announcements: #{Announcement.currents(@request.session[:announcements_hide_time]).map(&:to_s)}"
      @currents.each do |a|
        puts "should vvvvvvvvvvv #{a.message}: start #{a.starts_at.to_s :datetime} now #{Time.now.to_s :datetime} end #{a.ends_at.to_s :datetime} session: #{@request.session[:announcements_hide_time].to_s :datetime}"
        current_path.should_not have_content a.message unless a == @just_updated
        puts "should ^^^^^^^^^^^^^^"
      end
    end

    it "should show an announcement updated after hide time" do
      current_path.should have_content @just_updated.message
    end
    
    it "should show an announcement created after hide time" do
      current_path.should have_content @just_created.message
    end
  end

end


