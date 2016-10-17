server 'vagrant@localhost:2220', roles: %w{web app}
set :ssh_options, {
    keys: "../.vagrant/machines/default/virtualbox/private_key",
    auth_methods: %w{'publickey'}
}
