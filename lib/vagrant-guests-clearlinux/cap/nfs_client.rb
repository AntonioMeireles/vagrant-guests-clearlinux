module VagrantPlugins
  module GuestClearLinux
    module Cap
      class NFS
        def self.nfs_client_installed(machine)
          machine.communicate.test("test -x /usr/bin/mount.nfs")
        end

        def self.nfs_client_install(machine)
          comm = machine.communicate
          comm.sudo([
            # XXX: understand root cause
            'curl -Lsk https://cdn.download.clearlinux.org/update/',
            'swupd bundle-add nfs-utils',
            'systemctl enable rpcbind --now'
          ].join(' && '))
        end

        def self.nfs_pre(machine)
          machine.communicate.sudo('systemctl start rpcbind')
        end
      end
    end
  end
end
