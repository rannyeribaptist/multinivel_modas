  source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>=2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Rails better errors
gem "better_errors", :group => :development
gem "binding_of_caller", :group => :development
# HAML syntax
gem "haml-rails", "~> 1.0"
# Simple form rails helper
gem 'simple_form'
# more intuitive rails console
gem 'pry-rails', :group => :development

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Devise gems for user authentication
gem 'devise'
gem 'devise-i18n'

# For exception tracing in production
gem 'rollbar'

# User avatar uploader
gem 'carrierwave', '~> 2.0'

# Dynamic nested models management
gem "cocoon"

# Filterrific is a Rails Engine plugin that makes it easy to filter, search, and sort your ActiveRecord lists.
gem 'filterrific'
gem 'will_paginate', '~> 3.1.0'

# Mercado Pago
gem 'mercadopago-sdk', '~> 1.2'

# deal with json
gem 'json'

group :test do
  # for better unit tests
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing' # If you are using Rails 5.x
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # for unit tests
  gem 'rspec-rails', '~> 3.8'
  gem 'database_cleaner'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Database diagrams generator
  gem 'rails-erd', group: :development
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
