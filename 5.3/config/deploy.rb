set :deploy_to, '/vagrant/5.3/deploy'
set :repo_url, 'git://github.com/ikari7789/capistrano-laravel-test.git'
set :branch, '5.3'

set :default_env, {
  'PATH'           => "/usr/local/phpenv/shims:/usr/local/phpenv/bin:$PATH",
  'PHPENV_VERSION' => '7.0.11'
}

set :laravel_version, 5.3
