# encoding: UTF-8
# Copyright (c) 2017 Innovitable. All Rights Reserved.

require 'vagrant'

module VagrantPlugins
  module GuestInnovitable
    class Plugin < Vagrant.plugin('2')
      name 'Innovitable guest'
      description 'Innovitable guest support.'

      guest('innovitable', 'linux') do
        require_relative 'guest'
        Guest
      end

      guest_capability('innovitable', 'change_host_name') do
        require_relative 'cap/change_host_name'
        Cap::ChangeHostName
      end

      guest_capability('innovitable', 'configure_networks') do
        require_relative 'cap/configure_networks'
        Cap::ConfigureNetworks
      end

      guest_capability('innovitable', 'docker_daemon_running') do
        require_relative 'cap/docker'
        Cap::Docker
      end
    end
  end
end
