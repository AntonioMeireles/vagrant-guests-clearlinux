# encoding: UTF-8
# Copyright (c) 2017 Innovitable. All Rights Reserved.

require 'vagrant'

module VagrantPlugins
  module GuestInnovitable
    class Guest < Vagrant.plugin('2', :guest)
      def detect?(machine)
        machine.communicate.test("cat /etc/innovitable-release | grep 'Innovitable Linux'")
      end
    end
  end
end
