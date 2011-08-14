source 'http://rubygems.org'

gem 'devise'

gem 'rails', '~> 3.1.0.rc5'
gem 'settingslogic'

gem 'arel', '~> 2.1.4' # TODO: remove the line with 2.1.6 as 2.1.5 is buggy

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Asset template engines
gem 'haml'
gem 'sass-rails', '~> 3.1.0.rc'
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'
gem 'nokogiri'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  gem 'heroku' # http://todomodo.heroku.com/
  gem 'mysql'
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'rails_best_practices' # $ rails_best_practices
  # gem 'what_methods' # http://drnicwilliams.com/2006/10/12/my-irbrc-for-consoleirb/
end

group :development, :test do
  gem 'rspec-rails'      
  gem 'factory_girl_rails' # ok, but please don't create those obj in the db
end

group :test do
  gem 'capybara'
  gem 'launchy' # save_and_open_page # will open a browser in the middle of the test
  gem 'guard-rspec' # $ guard
  gem 'timecop'
  # Pretty printed test output
  gem 'turn', :require => false
end

