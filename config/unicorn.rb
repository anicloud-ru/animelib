proj_root = "/home/animelib/project"
if ENV['RAILS_ENV'] == 'production'
  app_name = 'animelib.ru'
  proj_root = "/home/animelib/project"
  app_root = "#{proj_root}/#{app_name}"

  worker_processes 32
  timeout 90
  listen "#{proj_root}/sockets/unicorn.socket", backlog: 4096
  working_directory app_root

  stderr_path "#{proj_root}/logs/unicorn.error.log"
  stdout_path "#{proj_root}/logs/unicorn.access.log"
  pid "#{proj_root}/pids/unicorn.pid"
elsif ENV['RAILS_ENV'] == 'development'
  app_name = 'test.animelib.ru'
  app_root = "#{proj_root}/#{app_name}"

  worker_processes 8
  timeout 90
  listen "#{proj_root}/sockets/testunicorn.socket", backlog: 4096
  working_directory app_root

  stderr_path "#{proj_root}/logs/testunicorn.error.log"
  stdout_path "#{proj_root}/logs/testunicorn.access.log"
  pid "#{proj_root}/pids/testunicorn.pid"
end


preload_app true

GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_root}/Gemfile"
end

before_fork do |server, worker|
  defined?(ApplicationRecord) and
    ApplicationRecord.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  ApplicationRecord.establish_connection
end
