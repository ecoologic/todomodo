require 'spec_helper'

describe Announcement do
  before(:each) do
    @pasts    = []
    @currents = []
    @futures  = []
    
    5.times do
      @pasts    << Factory.create(:past_announcement)
      @currents << Factory.create(:current_announcement)
      @futures  << Factory.create(:future_announcement)
    end

    @all = @pasts + @currents + @futures
    
  end

  describe 'current_announcements' do

    describe 'never being hidden' do

      it "should return all valid announcements" do
        @currents.map(&:id).should =~ Announcement.currents.map(&:id)
      end
    
      it "should not return any past announcements" do
        @pasts.map(&:id).should_not =~ Announcement.currents.map(&:id)
      end
    
      it "should not return any future announcements" do
        @futures.map(&:id).should_not =~ Announcement.currents.map(&:id)
      end
      
    end

    describe 'hidden yesterday' do

      it "should return all valid announcements" do
        @currents.map(&:id).should =~ Announcement.currents.map(&:id)
      end

      it "should not return any past announcements" do
        @pasts.map(&:id).should_not =~ Announcement.currents(Date.yesterday).map(&:id)
      end

      it "should not return any future announcements" do
        @futures.map(&:id).should_not =~ Announcement.currents.map(&:id)
      end
  
    end

  end






end

