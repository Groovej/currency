ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'capybara/rails'
require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'
require 'capybara/rspec'
require 'rspec/rails'
require "simplecov"
require 'factory_girl'
require 'capybara-screenshot/rspec'
SimpleCov.start "rails"

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

DEFAULT_HOST = "localhost"
DEFAULT_PORT = 3000

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  Capybara.javascript_driver = :webkit
  Capybara.current_driver = Capybara.javascript_driver
  Capybara.default_host = "http://#{DEFAULT_HOST}"
  Capybara.server_port = DEFAULT_PORT
  Capybara.raise_server_errors = false

  config.before :each do
    Capybara.app_host = "http://#{DEFAULT_HOST}:#{DEFAULT_PORT}"
  end

  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
  config.include Rails.application.routes.url_helpers
  Capybara::Webkit.configure do |config|
    config.allow_url("cdnjs.cloudflare.com")
  end

end
