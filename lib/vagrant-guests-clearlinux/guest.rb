# Copyright (c) 2018 António Meireles. All Rights Reserved.

require 'vagrant'

module VagrantPlugins
  module GuestClearLinux
    class Guest < Vagrant.plugin('2', :guest)
      def detect?(machine)
        machine.communicate.test("cat /usr/lib/os-release | grep 'ID=clear-linux-os'")
      end
    end
  end
end
