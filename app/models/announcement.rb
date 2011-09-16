# Site wide announcements from administration to all users
class Announcement < ActiveRecord::Base

  validates_presence_of :message, :starts_at, :ends_at

  # e.g.: Announcement[1] 15/09/2011 - 19:27:00 .. 15/09/2011 - 23:27:00: fooooooooo
  def to_s
    "Announcement[#{id}] #{starts_at.to_s :datetime} .. #{ends_at.to_s :datetime}: #{message}"
  end

  # all valid now, unless already seen (at hide_time)
  def self.currents(hide_time = nil)
    announcements = self.where ['now() BETWEEN starts_at AND ends_at']
    announcements = announcements.where ['updated_at > ?', hide_time] if hide_time
puts "currents: #{announcements.map(&:to_s)}"
    announcements
  end


end
