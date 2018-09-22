# encoding: UTF-8
# Copyright (c) 2018 António Meireles. All Rights Reserved.

require 'spec_helper'
require 'vagrant-guests-clearlinux/plugin'
require 'vagrant-guests-clearlinux/cap/change_host_name'
require 'vagrant-guests-clearlinux/cap/configure_networks'

describe VagrantPlugins::GuestClearLinux::Plugin do
  it 'should be loaded with ClearLinux' do
    expect(described_class.components.guests[:clearlinux].first).to eq(VagrantPlugins::GuestClearLinux::Guest)
  end

  {
    :change_host_name      => VagrantPlugins::GuestClearLinux::Cap::ChangeHostName,
    :configure_networks    => VagrantPlugins::GuestClearLinux::Cap::ConfigureNetworks
  }.each do |cap, cls|
    it "should be capable of #{cap} with ClearLinux" do
      expect(described_class.components.guest_capabilities[:clearlinux][cap]).to eq(cls)
    end
  end
end
