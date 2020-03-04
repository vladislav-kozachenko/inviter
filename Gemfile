source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
gem 'pg', '1.0.0'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'devise'
gem 'devise_invitable', '~> 2.0.0'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'grape_devise_token_auth'
gem 'rack-cors'


# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
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

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'letter_opener', '1.6.0'
  gem 'pry-rails', '0.3.6'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rubocop', '0.52.1'
  gem 'rspec-rails', '3.6'
  gem 'factory_bot_rails', '4.8.2'
  gem 'shoulda-matchers', '3.1.2'
  gem 'airborne'
  gem 'database_cleaner', '1.6.2'
  gem 'mailcatcher'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
