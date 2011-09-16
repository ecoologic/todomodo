source 'http://rubygems.org'

gem 'devise' # authentification

gem 'rails'

gem 'settingslogic' # see Setting model and settings.yml

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Asset template engines
gem 'haml'
gem 'sass-rails'
gem 'coffee-script'
gem 'uglifier'     # compress js in production
gem 'jquery-rails' # jquery
gem 'nokogiri'     # xml

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
               # https://github.com/ecoologic/todomodo
  gem 'heroku' # http://todomodo.heroku.com/
               # stack is bamboo-mri-1.9.2
               # git@heroku.com:todomodo.git

  gem 'ruby-debug19', :require => 'ruby-debug' # To use debugger with ruby 1.9
  gem 'rails_best_practices'                   # $ rails_best_practices
  # gem 'what_methods' # http://drnicwilliams.com/2006/10/12/my-irbrc-for-consoleirb/
end

group :development, :test do
  gem 'mongrel', '>= 1.2.0.pre2' # rails s mongrel # v1.2 works with rails 3.1
  gem 'mysql'
  gem 'pry' # pry -r ./config/environment / binding.pry
  gem 'rspec-rails'      
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'    # simulates the browser, for integration test
  gem 'launchy'     # save_and_open_page # will open a browser in the middle of the test
  gem 'guard-rspec' # $ guard runs the spec continuously 
  gem 'libnotify'   # for guard
  gem 'rb-inotify'  # for guard
  gem 'timecop'     # freeze the time
  gem 'turn', :require => false # Pretty printed test output
end

# to be used by heroku
# dbname vdsbzjlafn
# app    todomodo
group :production do
  # gem 'therubyracer-heroku', '>= 0.8.1.pre3' # javascript runtime required by heroku... but not working!
  gem 'therubyracer', '>= 0.9.3.beta1'      # working...
  gem 'pg'
end
