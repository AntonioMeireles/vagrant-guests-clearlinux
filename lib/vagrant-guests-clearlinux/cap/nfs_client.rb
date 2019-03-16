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
            "swupd bundle-add storage-utils",
            "systemctl enable rpcbind",
            "systemctl start rpcbind"
          ].join("\n"))
        end

        def self.nfs_pre(machine)
          machine.communicate.sudo('systemctl start rpcbind')
        end
      end
    end
  end
end
