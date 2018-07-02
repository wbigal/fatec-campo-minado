source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Brings back `assigns` and `assert_template` to your Rails tests
gem 'rails-controller-testing'
# ActiveModel::Serializer implementation and Rails hooks
gem 'active_model_serializers'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# Bootstrap 4 Ruby Gem for Rails / Sprockets and Compass.
gem 'bootstrap', '~> 4.1.1'
# A gem to automate using jQuery with Rails
gem 'jquery-rails'
# A library for generating fake data such as names, addresses,
# and phone numbers.
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
# Slim is a template language whose goal is reduce the syntax to the essential
# parts without becoming cryptic.
gem 'slim-rails'

group :development, :test do
  # Loads environment variables from `.env`
  gem 'dotenv-rails'
  # Call 'byebug' anywhere in the code to stop execution and
  #   get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Annotate Rails classes with schema and routes info
  gem 'annotate'
  # A static analysis security vulnerability scanner for RoR applications
  gem 'brakeman', require: false
  # Access an interactive console on exception pages or by calling 'console'
  #   anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # gem 'web-console', '>= 3.3.0'
  # A Ruby static code analyzer, based on the community Ruby style guide.
  gem 'rubocop', '0.55.0', require: false
  # Spring speeds up development by keeping your application running in the
  #   background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  # Strategies for cleaning databases in Ruby.
  # Can be used to ensure a clean state for testing.
  gem 'database_cleaner'
  # Collection of testing matchers extracted from Shoulda
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', require: false
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  # Code coverage for Ruby 1.9+ with a powerful configuration library and
  #  automatic merging of coverage across test suites
  gem 'simplecov', require: false
end

group :development, :test do
  # Factory Bot S2 Rails
  gem 'factory_bot_rails'
  # RSpec for Rails-3+
  gem 'rspec-rails', '~> 3.7'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
