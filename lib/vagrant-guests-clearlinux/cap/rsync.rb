module VagrantPlugins
  module GuestClearLinux
    module Cap
      class RSync
        def self.rsync_installed(machine)
          machine.communicate.test("test -f /usr/bin/rsync")
        end

        def self.rsync_install(machine)
          # until it is available as a pundle...
          machine.communicate.sudo("swupd bundle-add network-basic")
        end
      end
    end
  end
end
