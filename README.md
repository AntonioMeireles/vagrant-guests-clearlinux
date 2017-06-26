# vagrant-guests-innovitable 

This is a [Vagrant](http://www.vagrantup.com/) [plugin](http://docs.vagrantup.com/v2/plugins/index.html) that adds Innovitable guest support.

## Installation

```
$ vagrant plugin install vagrant-guests-innovitable
```

## Development
To build and install the plugin directly from this repo:

```
$ bundle install
$ bundle rake build
$ vagrant plugin install pkg/vagrant-guests-innovitable-0.0.1.gem
```

You can run RSpec with:

```
$ bundle install
$ bundle exec rake
```
