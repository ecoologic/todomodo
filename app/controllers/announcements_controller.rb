# controller for announcements
class AnnouncementsController < ApplicationController

  respond_to :html, :js

  # in layouts/application
  # will then show only announcements updated after action
  # GET /announcements/hide_current (hide_current_announcements_path)
  def hide_currents
    session[:announcements_hide_time] = Time.now

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
