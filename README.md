# vagrant-guests-clearlinux

This is *the* **[Vagrant](http://www.vagrantup.com/)**
*[plugin](http://docs.vagrantup.com/v2/plugins/index.html)*
that adds **[Clear Linux](https://clearlinux.org)** guest support.

> Once this plugin gets feature complete and rock solid, and time and resources permit,
> work will start in order to get it merged with upstream Vagrant.

Besides adding proper **[Clear Linux](https://clearlinux.org)** guest support to Vagrant this
plugin also comes bundled with a simple
[swupd](https://clearlinux.org/documentation/clear-linux/guides/maintenance/swupd-guide)
provisioner in order to enable basic `swupd` operations straight from the `Vagrantfile`:

- adding one or more bundles

  ```ruby
  config.vm.provision :bundle_add, bundles: 'wireshark'
  # alternatively ... functionally equivalent to above
  # config.vm.provision :bundle_add do |p|
  #  p.bundles = 'wireshark'
  # end
  ```

- removing one or more bundles

  ```ruby
  # assuming it was installed already ...
  config.vm.provision :bundle_remove, bundles: [ 'wireshark', 'nmap' ]
  # alternatively ... functionally equivalent to above
  # config.vm.provision :bundle_remove do |p|
  #  p.bundles = ['wireshark', 'nmap']
  # end
  ```

## Compatible Vagrant boxes

The **Clear Linux** Vagrant [boxes](https://app.vagrantup.com/AntonioMeireles/boxes/ClearLinux) come
bundled with this plugin and, in most conditions, should install it automatically.

For additional information about them please visit their
[documentation](https://github.com/AntonioMeireles/ClearLinux-packer/blob/master/README.md).

## Manual Installation

```shell
❯❯❯ vagrant plugin install vagrant-guests-clearlinux
```

## Manual Upgrading

```shell
❯❯❯ vagrant plugin update vagrant-guests-clearlinux
```

## Development

To build, install or modify the plugin directly from this repository:

> NOTE: commands bellow assume you have a working docker environment.

```shell
❯❯❯ make build
❯❯❯ make local-install VERSION=...
```

where `VERSION` is whatever is being set in `lib/vagrant-guests-clearlinux/version.rb`

You can run RSpec with:

```shell
❯❯❯ bundle install
❯❯❯ bundle exec rake
```

## Acknowledgments

This was developed,  initially, inspired in works of [Fabio Rapposelli](https://github.com/frapposelli)
on [vagrant-guests-photon](https://github.com/vmware/vagrant-guests-photon) and
[Alex Sorkin](https://github.com/alexsorkin) on
[vagrant-guests-innovitable](https://github.com/alexsorkin/vagrant-guests-innovitable).

