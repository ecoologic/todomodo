source 'http://rubygems.org'

gem 'devise'

gem 'rails', '~> 3.1.0.rc'

gem 'settingslogic'

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
  gem 'ruby-debug19', :require => 'ruby-debug' # To use debugger
  gem 'rails_best_practices' # $ rails_best_practices
  # gem 'what_methods' # http://drnicwilliams.com/2006/10/12/my-irbrc-for-consoleirb/
end

group :development, :test do
  gem 'mongrel', '~> 1.2.0.pre2' # rails s mongrel
  gem 'mysql'
  gem 'pry' # pry -r ./config/environment / binding.pry
  gem 'rspec-rails'      
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'launchy' # save_and_open_page # will open a browser in the middle of the test
  gem 'guard-rspec' # $ guard
  gem 'libnotify'
  gem 'rb-inotify'
  gem 'timecop'
  gem 'turn', :require => false # Pretty printed test output
end

