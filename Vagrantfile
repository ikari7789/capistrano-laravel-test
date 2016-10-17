# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/precise64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 22, host: 2220

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    # Create swap file
    dd if=/dev/zero of=/swapfile bs=1024 count=262144
    mkswap /swapfile
    swapon /swapfile

    # Update apt caches
    apt-get update

    # Install Git
    apt-get install -y git

    # Install phpenv
    export PHPENV_ROOT="/usr/local/phpenv"
    curl -L http://git.io/phpenv-installer | bash

    # Load phpenv into the current session
    export PATH="${PHPENV_ROOT}/bin:${PATH}"
    eval "$(phpenv init -)"

    # Set phpenv to load for all users
    echo 'export PHPENV_ROOT="/usr/local/phpenv"'       >  /etc/profile.d/phpenv.sh
    echo 'if [ -d "${PHPENV_ROOT}" ]; then'             >> /etc/profile.d/phpenv.sh
    echo '    export PATH="${PHPENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/phpenv.sh
    echo '    eval "$(phpenv init -)"'                  >> /etc/profile.d/phpenv.sh
    echo 'fi'                                           >> /etc/profile.d/phpenv.sh

    chmod +x /etc/profile.d/phpenv.sh

    # Install Composer
    git clone https://github.com/ngyuki/phpenv-composer.git $(phpenv root)/plugins/phpenv-composer
    phpenv rehash

    # Install common dependencies
    phpenv common-deps-install-ubuntu-12-04

    # Install bison and re2c
    apt-get install -y autoconf bison pkg-config re2c

    # Install libxml2
    apt-get install -y libxml2 libxml2-dev

    # Install OpenSSL
    apt-get install -y openssl libssl-dev

    # Install libcurl4-openssl-dev
    apt-get install -y curl libcurl4-openssl-dev

    # Install libjpeg-turbo8
    apt-get install -y libjpeg-turbo8 libjpeg-turbo8-dev

    # Install libpng12-0
    apt-get install -y libpng12-0 libpng12-dev

    # Install libmcrypt4
    apt-get install -y libmcrypt4 libmcrypt-dev

    # Install libreadline
    apt-get install -y readline-common libreadline6 libreadline6-dev

    # Install libtidy
    apt-get install -y tidy libtidy-0.99-0 libtidy-dev

    # Install libxslt1
    apt-get install -y xsltproc libxslt1.1 libxslt1-dev

    # Remove unneeded packages
    apt-get autoremove -y

    PHPS=(5.6.26 7.0.11)
    for php in ${PHPS[@]}; do
        # Install PHP
        phpenv install ${php}
        phpenv global ${php}
        # Execute an empty composer command just to install it
        composer
    done
  SHELL
end
