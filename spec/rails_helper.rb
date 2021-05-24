ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rails-controller-testing'
require 'factory_bot_rails'
require 'shoulda/matchers'

Capybara.ignore_hidden_elements = false

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.render_views
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  #config.include Devise::Test::ControllerHelpers, type: :controller
  #config.include JsonResponse, type: :controller
  #config.include ControllerResource, type: :controller

  config.before :each do
    if respond_to?(:controller) && controller
      allow(controller)
        .to receive(:default_url_options)
              .and_return ApplicationController.default_url_options
    end
  end

  config.after :each do
    if respond_to?(:controller) && controller
      controller.params.delete_if { true }
    end
  end

  Rails.application.routes.default_url_options = ApplicationController.default_url_options
end