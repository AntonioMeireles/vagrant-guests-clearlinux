# encoding: UTF-8
# Copyright (c) 2017 Innovitable. All Rights Reserved.

module VagrantPlugins
  module GuestInnovitable
    module Cap
      module Docker
        def self.docker_daemon_running(machine)
          machine.communicate.test('test -S /run/docker.sock')
        end
      end
    end
  end
end
