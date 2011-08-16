class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :get_current_announcements

  # TODO: rescue_from Exception, :with => :render_error

  # welcome page
  def show
  end

private #======================================================================

  def get_current_announcements
    @current_announcements ||= Announcement.currents(session[:announcement_hide_time])
  end
end
