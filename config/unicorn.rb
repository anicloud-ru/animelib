app_name = 'animelib'
app_root = "/root/#{app_name}"

worker_processes 16
timeout 30
listen "#{app_root}/tmp/sockets/unicorn.socket", backlog: 4096
working_directory app_root

stderr_path "#{app_root}/log/unicorn.error.log"

pid "#{app_root}/tmp/pids/unicorn.pid"

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
