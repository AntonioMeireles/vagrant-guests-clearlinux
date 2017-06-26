# encoding: UTF-8
# Copyright (c) 2017 Innovitable. All Rights Reserved.

require 'spec_helper'
require 'vagrant-guests-innovitable/guest'

describe VagrantPlugins::GuestInnovitable::Guest do
  include_context 'machine'

  it 'should be detected with Innovitable' do
    expect(communicate).to receive(:test).with("cat /etc/innovitable-release | grep 'Innovitable Linux'")
    guest.detect?(machine)
  end
end
