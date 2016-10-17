set :deploy_to, '/vagrant/4.2/deploy'
set :repo_url, 'git://github.com/ikari7789/capistrano-laravel-test.git'
set :branch, '4.2'

set :default_env, {
  'PATH'           => "/usr/local/phpenv/shims:/usr/local/phpenv/bin:$PATH",
  'PHPENV_VERSION' => '5.6.26'
}

set :laravel_version, 4.2
