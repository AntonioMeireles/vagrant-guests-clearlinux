module VagrantPlugins
  module GuestClearLinux
    module Cap
      class NFS
        def self.nfs_client_installed(machine)
          machine.communicate.test('test -x /usr/bin/mount.nfs')
        end

        def self.nfs_client_install(machine)
          comm = machine.communicate
          comm.sudo([
            'swupd bundle-add nfs-utils',
            'systemctl enable rpcbind --now',
            'systemctl enable nfs-client.target --now'
          ].join(' && '))
        end

        def self.nfs_pre(machine)
          comm = machine.communicate
          comm.sudo([
            'systemctl start rpcbind',
            'systemctl start nfs-client.target'
          ].join(' && '))
        end
      end
    end
  end
end
