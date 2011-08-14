require 'spec_helper'

describe JavascriptsController do

  describe '#hide_announcements' do 

    it 'should update announcement_hide_time in session' do
      session[:announcements_hide_time] = nil
      get 'hide_announcements', :format => :js
      session[:announcements_hide_time].class.should be_present # TODO: implement timecop gem
    end
    
  end
end
