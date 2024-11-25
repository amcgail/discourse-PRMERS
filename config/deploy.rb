set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :format, :pretty
set :log_level, :info
set :pty, true

# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "PRMERS"
set :repo_url, "git@github.com:amcgail/discourse-PRMERS.git"

# set the directory for the plugins
set :deploy_to, "/home/ubuntu/PRMERS-plugins"

# Default value for :linked_files is []
append :linked_files, "plugins"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
