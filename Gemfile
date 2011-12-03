source 'http://rubygems.org'

gem 'rails'         # the best ever!

gem 'devise'        # authentification
gem 'settingslogic' # see Setting model and settings.yml

gem 'carrierwave'   # for images (avatar) in app/uploader
gem 'rmagick'       # to resize images (see avatar_uploader)

gem 'activeadmin'   # all the admin side see railscasts#284
                    # $ rails g active_admin:resource MODEL

# gem 'ruby-prof'     # $ rails profiler


# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Asset template engines
gem 'haml'
gem 'sass-rails'
gem 'coffee-script'
gem 'uglifier'     # compress js in production
gem 'jquery-rails' # jquery
gem 'nokogiri'     # xml

gem 'discogs-wrapper' # client to discogs, see albums

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  gem 'heroku' # see production below
  gem 'ruby-debug19', :require => 'ruby-debug' # To use debugger with ruby 1.9
  gem 'rails_best_practices'                   # $ rails_best_practices
  # gem 'pry'    # $ pry -r ./config/environment # binding.pry
end

group :development, :test do
  gem 'mongrel', '>= 1.2.0.pre2' # rails s mongrel # v1.2 works with rails 3.1
  gem 'mysql'
end

# NOTE: remember to run    $ rake db:test:prepare before run tests
#       run the tests with $ guard
group :test do
  gem 'rspec-rails'      
  gem 'factory_girl_rails'
  gem 'capybara'    # simulates the browser, for integration test
  gem 'launchy'     # save_and_open_page # will open a browser in the middle of the test
  gem 'guard-rspec' # $ guard runs the spec continuously 
  gem 'libnotify'   # for guard
  gem 'rb-inotify'  # for guard
  gem 'timecop'     # freeze the time
  gem 'turn', :require => false # Pretty printed test output
end

# staging by itself does not really make sense
# but it's ready to use if you move production
# $ rake db:create RAILS_ENV=staging
group :staging do
  gem 'mysql'
  gem 'passenger'
end

# to be used by heroku
# stack is bamboo-mri-1.9.2
# https://github.com/ecoologic/todomodo
# git@heroku.com:todomodo.git
# http://todomodo.heroku.com
# dbname vdsbzjlafn
# app    todomodo
# $ heroku config:add BUNDLE_WITHOUT="development:test:staging" --app todomodo
group :production do
  # gem 'therubyracer-heroku', '>= 0.8.1.pre3' # javascript runtime required by heroku... but not working!
  gem 'therubyracer', '>= 0.9.3.beta1'         # working...
  gem 'pg'
end
