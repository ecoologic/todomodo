Factory.define :user do |f|
  f.sequence(:email) {|n| "user#{n}@test.com"}
  f.password 'Test123'
  f.password_confirmation {|u| u.password}
end

Factory.define :announcement do |f|
  # TODO
end
