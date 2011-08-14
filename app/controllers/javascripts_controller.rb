# general controller for all js actions 
class JavascriptsController < ApplicationController


  def hide_announcements
    session[:announcements_hide_time] = Time.now
  end


end
