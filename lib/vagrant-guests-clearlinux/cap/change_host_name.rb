# Copyright (c) 2018 António Meireles. All Rights Reserved.

module VagrantPlugins
  module GuestClearLinux
    module Cap
      class ChangeHostName
        def self.change_host_name(machine, name)
          machine.communicate.tap do |comm|
            unless comm.test("hostnamectl --static | grep '#{name}'")
              comm.sudo([
                'rm /etc/machine-id',
                'systemd-machine-id-setup',
                "hostnamectl set-hostname --static '#{name}'",
                "hostnamectl set-hostname --transient '#{name}'",
                'hostnamectl set-hostname --set-chassis vm',
                'systemctl restart systemd-networkd.service'
              ].join("\n"))
            end
          end
        end
      end
    end
  end
end
