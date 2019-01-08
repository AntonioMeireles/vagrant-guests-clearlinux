# vagrant-guests-clearlinux

This is a [Vagrant](http://www.vagrantup.com/) [plugin](http://docs.vagrantup.com/v2/plugins/index.html)
that adds [Clear Linux](https://clearlinux.org) guest support.
Once it gets feature complete and rock solid work will start
in order to get its functionality merged in upstream Vagrant.

## Installation

```
$ vagrant plugin install vagrant-guests-clearlinux
```

## Development
To build and install the plugin directly from this repo:

```
$ bundle install
$ bundle exec rake build
$ vagrant plugin install pkg/vagrant-guests-clearlinux-1.0.15.gem
```

You can run RSpec with:

```
$ bundle install
$ bundle exec rake
```
## Compatible Vagrant boxes

You can find matching Vagrant boxes on [here](https://app.vagrantup.com/AntonioMeireles/boxes/ClearLinux).

## Acknowledgments

This is a refactoring based on early works of [Fabio Rapposelli](https://github.com/frapposelli) on
[vagrant-guests-photon](https://github.com/vmware/vagrant-guests-photon) and
[Alex Sorkin](https://github.com/alexsorkin) on [vagrant-guests-innovitable](https://github.com/alexsorkin/vagrant-guests-innovitable).

