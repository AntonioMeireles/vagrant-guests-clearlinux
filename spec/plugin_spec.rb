# encoding: UTF-8
# Copyright (c) 2017 Innovitable. All Rights Reserved.

require 'spec_helper'
require 'vagrant-guests-innovitable/plugin'
require 'vagrant-guests-innovitable/cap/change_host_name'
require 'vagrant-guests-innovitable/cap/configure_networks'
require 'vagrant-guests-innovitable/cap/docker'

describe VagrantPlugins::GuestInnovitable::Plugin do
  it 'should be loaded with innovtibale' do
    expect(described_class.components.guests[:innovitable].first).to eq(VagrantPlugins::GuestInnovitable::Guest)
  end

  {
    :docker_daemon_running => VagrantPlugins::GuestInnovitable::Cap::Docker,
    :change_host_name      => VagrantPlugins::GuestInnovitable::Cap::ChangeHostName,
    :configure_networks    => VagrantPlugins::GuestInnovitable::Cap::ConfigureNetworks
  }.each do |cap, cls|
    it "should be capable of #{cap} with innovitable" do
      expect(described_class.components.guest_capabilities[:innovitable][cap]).to eq(cls)
    end
  end
end
