module ApplicationHelper

  # show all the flash messages
  def flash_messages
    result = raw '' # TODO: sure there is a better way
    flash.collect do |level, message|
      result << content_tag(:div, message, :id => "flash-#{level}")
    end
    result
  end

  # the list of announcements to show
  def current_announcements
    @current_announcements ||= Announcement.current_announcements(session[:announcement_hide_time])
  end

end
