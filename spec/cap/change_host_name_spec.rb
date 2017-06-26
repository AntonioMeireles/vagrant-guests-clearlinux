# encoding: UTF-8
# Copyright (c) 2017 Innovitable. All Rights Reserved.

require 'vagrant-guests-innovitable/cap/change_host_name'
require 'spec_helper'

describe VagrantPlugins::GuestInnovitable::Cap::ChangeHostName do
  include_context 'machine'

  it 'should change hostname when hostname is differ from current' do
    hostname = 'vagrant-innovitable'
    expect(communicate).to receive(:test).with("hostnamectl --static | grep 'vagrant-innovitable'")
    communicate.should_receive(:sudo).with("rm /etc/machine-id")
    communicate.should_receive(:sudo).with("systemd-machine-id-setup")
    communicate.should_receive(:sudo).with("hostnamectl set-hostname #{hostname.split('.')[0]}")
    described_class.change_host_name(machine, hostname)
  end

  it 'should not change hostname when hostname equals current' do
    hostname = 'vagrant-innovitable'
    communicate.stub(:test).and_return(true)
    communicate.should_not_receive(:sudo)
    described_class.change_host_name(machine, hostname)
  end
end
