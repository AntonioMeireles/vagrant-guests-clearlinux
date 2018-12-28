# encoding: UTF-8
# Copyright (c) 2018 António Meireles. All Rights Reserved.

require 'vagrant'

module VagrantPlugins
  module GuestClearLinux
    class Plugin < Vagrant.plugin('2')
      name 'Clear Linux guest'
      description 'Clear Linux guest support.'

      guest('clearlinux', 'linux') do
        require_relative 'guest'
        Guest
      end

      guest_capability('clearlinux', 'change_host_name') do
        require_relative 'cap/change_host_name'
        Cap::ChangeHostName
      end

      guest_capability('clearlinux', 'configure_networks') do
        require_relative 'cap/configure_networks'
        Cap::ConfigureNetworks
      end

      guest_capability('clearlinux', 'nfs_client_installed') do
        require_relative 'cap/nfs_client'
        Cap::NFS
      end

      guest_capability('clearlinux', 'nfs_client_install') do
        require_relative 'cap/nfs_client'
        Cap::NFS
      end

      guest_capability(:clearlinux, :rsync_install) do
        require_relative "cap/rsync"
        Cap::RSync
      end

      guest_capability(:clearlinux, :rsync_installed) do
        require_relative "cap/rsync"
        Cap::RSync
      end
    end
  end
end
