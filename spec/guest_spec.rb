# encoding: UTF-8
# CCopyright (c) 2018 António Meireles. All Rights Reserved.

require 'spec_helper'
require 'vagrant-guests-clearlinux/guest'

describe VagrantPlugins::GuestClearLinux::Guest do
  include_context 'machine'

  it 'should be detected with ClearLinux' do
    expect(communicate).to receive(:test).with("cat /usr/lib/os-release | grep 'ID=clear-linux-os'")
    guest.detect?(machine)
  end
end
