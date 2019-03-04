# encoding: UTF-8
# Copyright (c) 2019 António Meireles. All Rights Reserved.

require 'vagrant'

module VagrantPlugins
  module GuestClearLinux

    class BundlesConfig < Vagrant.plugin('2', :config)
      attr_accessor :bundles

      def initialize
        super
        @bundles = UNSET_VALUE
      end

      def finalize!
        @bundles = [] if @bundles == UNSET_VALUE
      end
      def bundles=(bundles)
        if bundles.kind_of?(Array)
          @bundles = Array.new(bundles)
        else
           @bundles = [ bundles ]
        end
      end
    end

    class BundleAddProvisioner < Vagrant.plugin('2', :provisioner)
      def provision
        @config.bundles.each do | item |
          @machine.ui.info("installing '#{item}' bundle")
          @machine.communicate.sudo("swupd bundle-add '#{item}'") do |type, data|
            @machine.env.ui.info(data.chomp, prefix: false)
          end
        end
      end
    end

    class BundleRemoveProvisioner < Vagrant.plugin('2', :provisioner)

      def provision
        @config.bundles.each do | item |
          @machine.ui.info("removing '#{item}' bundle")
          @machine.communicate.sudo("swupd bundle-remove '#{item}'") do |type, data|
            @machine.env.ui.info(data.chomp, prefix: false)
          end
        end
      end

    end
  end
end