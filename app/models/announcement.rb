# Site announcements from administration to all users
class Announcement < ActiveRecord::Base
  
  # all valids now, unless already seen (at hide_time)
  def self.current_announcements(hide_time = nil)
    announcements = where ['now() BETWEEN starts_at AND ends_at']
    announcements.where ['updated_at > ?', hide_time] if hide_time

    announcements
  end
  
end
