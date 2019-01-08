# vagrant-guests-clearlinux

This is a [Vagrant](http://www.vagrantup.com/)
[plugin](http://docs.vagrantup.com/v2/plugins/index.html)
that adds [Clear Linux](https://clearlinux.org) guest support.
Once it gets feature complete and rock solid work will start
in order to get its functionality merged in upstream Vagrant.

## Installation

```
$ vagrant plugin install vagrant-guests-clearlinux
```

## Updading

```
$ vagrant plugin update vagrant-guests-clearlinux
```

## Development

To build, install or modify the plugin directly from this repository:

> NOTE: commands bellow assume you have a working docker environment.

```
$ make build
$ make local-install VERSION=...
```

where `VERSION` is whatever is being set in `lib/vagrant-guests-clearlinux/version.rb`

You can run RSpec with:

```
$ bundle install
$ bundle exec rake
```

## Compatible Vagrant boxes

You can find matching Vagrant boxes on [here](https://app.vagrantup.com/AntonioMeireles/boxes/ClearLinux).

## Acknowledgments

This started based on early work of [Fabio Rapposelli](https://github.com/frapposelli) on
[vagrant-guests-photon](https://github.com/vmware/vagrant-guests-photon) and
[Alex Sorkin](https://github.com/alexsorkin) on
[vagrant-guests-innovitable](https://github.com/alexsorkin/vagrant-guests-innovitable)

