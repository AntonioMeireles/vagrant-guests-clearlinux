# encoding: UTF-8
# Copyright (c) 2017 Innovitable. All Rights Reserved.

module VagrantPlugins
  module GuestInnovitable
    module Cap
      class ChangeHostName
        def self.change_host_name(machine, name)
          machine.communicate.tap do |comm|
            unless comm.test("hostnamectl --static | grep '#{name}'")
              comm.sudo("rm /etc/machine-id")
              comm.sudo("systemd-machine-id-setup")
              comm.sudo("hostnamectl set-hostname #{name.split('.')[0]}")
            end
          end
        end
      end
    end
  end
end
