require_relative "boot"

require "rails/all"

require_relative '../lib/i18n_lib'

Bundler.require(*Rails.groups)

module Animelib
  if ENV["RAILS_ENV"] == 'development'
    S3_BUCKET = "animelib-s3-stoke"
  elsif ENV["RAILS_ENV"] == 'production'
    S3_BUCKET = "animelib"
  end
  class Application < Rails::Application
    config.load_defaults 6.1

    config.autoload_paths += Dir["#{config.root}/app/**"]
    config.autoload_paths += Dir["#{config.root}/app/lib/**"]
    config.paths.add 'lib', eager_load: true
    Aws.config.update(
      endpoint: "https://storage.yandexcloud.net"
    )

    config.time_zone = 'Europe/Moscow'
    I18n.enforce_available_locales = true
    config.i18n.default_locale = :ru
    config.i18n.locale = :ru
    config.i18n.available_locales = %i[ru en]
    config.i18n.load_path += Dir["#{config.root}/locales/**/*.yml"]

    config.generators.template_engine :slim
    config.generators.stylesheets false
    config.generators.helper false
    config.generators.test_framework :rspec
  end
end
