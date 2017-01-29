server 'vagrant@localhost', roles: %w{web app}
set :ssh_options, {
    keys: "~/.ssh/id_rsa",
    auth_methods: %w{'publickey'}
}
