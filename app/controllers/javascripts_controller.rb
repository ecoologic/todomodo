# general controller for all js actions 
class JavascriptsController < ApplicationController


  def hide_announcement
    session[:announcement_hide_time] = Time.now
  end


end
