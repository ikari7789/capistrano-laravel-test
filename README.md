# capistrano-laravel-test
Laravel application for testing the Capistrano laravel plugin.

# How to run all tests

```shell
vagrant up
vagrant ssh
cd /vagrant
./run-tests.sh
```

# How to tests against a specific version

```shell
vagrant up
vagrant ssh
cd /vagrant
./run-tests.sh {version: 4.2, 5.0, 5.1, 5.2, 5.3}
```
