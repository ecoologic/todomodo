# general controller for all js actions
# obviously this is not going to be a restful controller 
class JavascriptsController < ApplicationController
  # layout :false
  respond_to :js

  # hide all announcements created/updated before current times
  def hide_announcements
    session[:announcements_hide_time] = Time.now
    respond_with :js
  end


end
