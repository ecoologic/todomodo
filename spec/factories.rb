Factory.define :user do |f|
  f.sequence(:email) {|n| "user#{n}@test.com"}
  f.password 'Test123'
  f.password_confirmation {|u| u.password}
end

Factory.define :current_announcement, :class => Announcement do |f|
  f.starts_at Date.yesterday
  f.ends_at Date.tomorrow
  f.sequence(:message) {|n| "current announcement number #{n}"}
end

Factory.define :past_announcement, :class => Announcement do |f|
  f.starts_at Time.now - 2.days
  f.ends_at Time.now - 1.day
  f.sequence(:message) {|n| "past announcement number #{n}"}
end

Factory.define :future_announcement, :class => Announcement do |f|
  f.starts_at Time.now + 1.days
  f.ends_at Time.now + 2.day
  f.sequence(:message) {|n| "past announcement number #{n}"}
end


