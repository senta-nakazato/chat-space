require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'rails-controller-testing'
require 'devise'
require File.expand_path("spec/support/controller_macros.rb")
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.filter_rails_from_backtrace!
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include ControllerMacros, type: :controller
   config.use_transactional_fixtures = true
    [:controller, :view, :request].each do |type|
      config.include ::Rails::Controller::Testing::TestProcess, :type => type
      config.include ::Rails::Controller::Testing::TemplateAssertions, :type => type
      config.include ::Rails::Controller::Testing::Integration, :type => type
    end
    config.infer_spec_type_from_file_location!
end

