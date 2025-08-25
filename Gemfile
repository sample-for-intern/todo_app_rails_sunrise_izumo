source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.6"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.0.alpha"
gem "importmap-rails"
gem "rails-i18n"

# The asset pipeline provides a framework to concatenate and minify your
# JavaScript and CSS assets.


# Use the Puma web server
gem "puma", "~> 6.4"

# A Ruby wrapper for the popular Node.js library of the same name.


# Use the sqlite3 gem as the database for Active Record
gem "sqlite3", "~> 2.1"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 5.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Windows does not have a built-in JavaScript runtime.
# Add a JS runtime here to use Node.js via ExecJS.
# gem "execjs"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Active Job adapter to run jobs in background.
# gem "sidekiq"

# Use Solid Cache as the cache store for Active Record
gem "solid_cache"

# Use Solid Queue as the Active Job backend
gem "solid_queue"

# Use Action Cable backend
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# A static analysis security vulnerability scanner
gem "brakeman", require: false

# A Ruby static code analyzer and formatter
gem "rubocop", require: false



# Deploy your app to any server with SSH access
gem "kamal"

# Add support for application-level PWA features
gem "pwa"

# Use Capybara for integration testing
# gem "capybara"

# Use Selenium for integration testing
# gem "selenium-webdriver"

# Use headless Chrome for integration testing
# gem "webdrivers"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages
  gem "web-console"

  # Add analysis engine for RuboCop
  gem "rubocop-rails", require: false
end

group :test do
  # Adds support for Capybara system testing and screenshots
  gem "capybara"

  # Use simplecov for code coverage
  gem "simplecov", require: false

  # Use rspec for testing
  # gem "rspec-rails"
end
gem 'foreman'