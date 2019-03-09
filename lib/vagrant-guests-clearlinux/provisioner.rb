# encoding: UTF-8
# Copyright (c) 2019 António Meireles. All Rights Reserved.

require 'vagrant'
require 'tzinfo'

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
          @bundles = bundles.join(" ")
        else
           @bundles = bundles
        end
      end
    end

    class TimezoneConfig < Vagrant.plugin('2', :config)
      attr_accessor :timezone

      def initialize
        super
        @timezone = UNSET_VALUE
      end

      def finalize!
        super
        @timezone = '' if @timezone == UNSET_VALUE
      end

      def validate(machine)
        errors = _detected_errors

        TZInfo::Timezone.get(timezone)
        { "vm.provision.set_timezone:" => errors }
      rescue TZInfo::InvalidTimezoneIdentifier
        errors <<  "Invalid (user provided) timezone: '#{timezone}', Aborting!"

        { "vm.provision.set_timezone:" => errors }
      end

      def timezone=(timezone)
        @timezone = timezone
      end
    end

    class TimezoneProvisioner < Vagrant.plugin('2', :provisioner)
      def provision
        @machine.ui.detail("setting (user provided) timezone to '#{@config.timezone}'")
        @machine.communicate.sudo("timedatectl set-timezone #{@config.timezone}") do |type, data|
          if [:stderr, :stdout].include?(type)
            color = type == :stdout ? :green : :red

            options = {}
            options[:color] = color

            @machine.ui.detail(data.chomp, options)
          end
        end
      end
    end

    class BundleAddProvisioner < Vagrant.plugin('2', :provisioner)
      def provision
        @machine.ui.detail("installing the following bundle(s): '#{@config.bundles}'")
        @machine.communicate.sudo("swupd bundle-add #{@config.bundles}") do |type, data|
          if [:stderr, :stdout].include?(type)
            color = type == :stdout ? :green : :red

            options = {}
            options[:color] = color

            @machine.ui.detail(data.chomp, options)
          end
        end
      end
    end

    class BundleRemoveProvisioner < Vagrant.plugin('2', :provisioner)

      def provision
        @machine.ui.detail("removing the following bundle(s): '#{@config.bundles}'")
        @machine.communicate.sudo("swupd bundle-remove #{@config.bundles}") do |type, data|
          if [:stderr, :stdout].include?(type)
            color = type == :stdout ? :green : :red

            options = {}
            options[:color] = color

            @machine.ui.detail(data.chomp, options)
          end
        end
      end
    end

  end
end
