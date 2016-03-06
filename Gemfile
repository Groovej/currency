source 'https://rubygems.org'
ruby "2.2.2"
gem 'rails', '4.2.5.2'

group :development, :test do
	gem 'sqlite3'
end

gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'nokogiri', '~>1.6.1'
gem 'savon'
gem 'active_model_serializers', '~> 0.9.4'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry', require: false
  gem 'pry-nav', require: false
  gem 'pry-doc', require: false
  gem 'rspec-rails', '~> 3.1.0'
  gem 'rspec-its', '~> 1.2.0'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  gem 'capybara-screenshot'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

