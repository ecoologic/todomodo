require 'spec_helper'

# without loading factory
describe "Without announcements in layout" do
  it "should work when there are no current announcements" do
    visit root_path
    page.body.should have_content 'welcome'
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

    # TODO: test with js
    # it "should hide all announcements when hide link is clicked (js)", :js => true do
    #   click_link 'hide'
    #   @all.each {|a| current_path.should_not have_content a.message}
    # end

  end


  describe "hide pressed" do
    before(:each) do
      visit root_path
      click_link 'hide'
      sleep DELAY
      @just_updated = @currents.first
      @just_updated.update_attribute(:message, 'Just updated announcement')
      @just_created = Factory(:current_announcement,
                              :message => 'Just created announcement')
      visit root_path
    end

    it "should not show any previously hidden announcement" do
      @currents.each do |a|
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


