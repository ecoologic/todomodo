# Site wide announcements from administration to all users
class Announcement < ActiveRecord::Base

  validates_presence_of :message

  # e.g.: Announcement(1069 13 Aug 23:00-15 Aug 23:00): current announcement number 1
  def to_s
    "Announcement(#{id} #{starts_at.to_s :short}-#{ends_at.to_s :short}): #{message}"
  end

  # all valid now, unless already seen (at hide_time)
  def self.currents(hide_time = nil)
    announcements = self.where ['now() BETWEEN starts_at AND ends_at']
    announcements = announcements.where ['updated_at > ?', hide_time] if hide_time

    announcements
  end


end
