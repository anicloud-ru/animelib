Sentry.init do |config|
  config.dsn = ENV['DSN']
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  config.traces_sample_rate = 1.0
end
