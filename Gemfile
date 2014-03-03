source 'https://rubygems.org'
ruby '2.1.0'
#ruby-gemset=defaultrails

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.2'
gem 'pg'
gem 'foundation-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'childprocess'
end

group :development do
  gem 'better_errors'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'libnotify'
  gem 'factory_girl_rails', '~> 4.2.1'
end

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 3.0.4'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '>= 1.1.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '>= 1.0.2'

gem 'haml'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Used for Heroku deployment
group :production do
  gem 'rails_12factor', '>= 0.0.2'
end
