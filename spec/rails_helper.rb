
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'debugger'
require 'launchy'
require 'byebug'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

   config.include Devise::TestHelpers, type: :controller

   config.use_transactional_fixtures = true

    config.include Warden::Test::Helpers

    Warden.test_mode!

    config.after(:each) do
        Warden.test_reset!
    end

    config.before(:suite) do
        DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
        DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, js: true) do
        DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
        DatabaseCleaner.start
    end

    config.after(:each) do
        DatabaseCleaner.clean
    end

  config.infer_spec_type_from_file_location!
end
