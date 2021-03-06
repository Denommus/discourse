if ENV['RAILS_ENV'] == 'production'

  # First, you need to change these below to your situation.
  APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  num_workers = ENV["NUM_WEBS"].to_i > 0 ? ENV["NUM_WEBS"].to_i : 4

  # Second, you can choose how many threads that you are going to run at same time.
  workers "#{num_workers}"
  threads 8, 32

  # Unless you know what you are changing, do not change them.
  bind "unix://#{APP_ROOT}/tmp/sockets/puma.sock"
  pidfile "#{APP_ROOT}/tmp/pids/puma.pid"
  state_path "#{APP_ROOT}/tmp/pids/puma.state"
  daemonize false
  preload_app!

end
