# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "laravel_5_0"
set :repo_url, 'git://github.com/ikari7789/capistrano-laravel-test.git'

# Default branch is :master
set :branch, '5.0'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :default_env, {
  'PATH'           => "/usr/local/phpenv/shims:/usr/local/phpenv/bin:$PATH",
  'RBENV_VERSION' => '5.6.30'
}

set :laravel_version, 5.0
