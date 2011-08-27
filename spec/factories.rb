
# Users =======================================================================

Factory.define :user do |f|
  f.sequence(:email) {|n| "user#{n}@test.com"}
  f.password 'Test123'
  f.password_confirmation {|u| u.password}
end


# Announcements ===============================================================

Factory.define :current_announcement, :class => Announcement do |f|
  f.starts_at Time.now - 1.hour
  f.ends_at   Time.now + 2.days
  f.sequence(:message) {|n| "current announcement number #{n}"}
end

Factory.define :past_announcement, :class => Announcement do |f|
  f.starts_at Time.now - 2.week
  f.ends_at   Time.now - 1.week
  f.sequence(:message) {|n| "past announcement number #{n}"}
end

Factory.define :future_announcement, :class => Announcement do |f|
  f.starts_at Time.now + 1.week
  f.ends_at   Time.now + 2.weeks
  f.sequence(:message) {|n| "past announcement number #{n}"}
end


# names =======================================================================

FEMALE_NAMES = ['martina', 'stefania', 'giovanna', 'lucia', 'jennica', 'ambra', 'lorena', 'katia', 'giulia', 'najat', 'tati', 'anna', 'barbara', 'samantha', 'kasey', 'antonella']
MALE_NAMES = ['tia', 'erik', 'roby', 'zambo', 'simo', 'tuccia', 'gio', 'alberto', 'lorenzo', 'andrea', 'paolo', 'michele', 'sergio', 'romeo', 'marco', 'gianni', 'luca']

