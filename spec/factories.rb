Factory.define :user do |f|
  f.sequence(:email) {|n| "user#{n}@test.com"}
  f.password 'Test123'
  f.password_confirmation {|u| u.password}
end

Factory.define :current_announcement do |f|
  f.starts_at Date.yesterday
  f.ends_at Date.tomorrow
  f.message 'current announcement'
end

Factory.define :past_announcement do |f|
  f.starts_at Time.now - 2.days
  f.ends_at Time.now - 1.day
  f.message 'past announcement'
end

Factory.define :future_announcement do |f|
  f.starts_at Time.now + 1.days
  f.ends_at Time.now + 2.day
  f.message 'future announcement'
end


