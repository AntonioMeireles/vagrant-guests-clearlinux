# encoding: UTF-8
# Copyright (c) 2018 António Meireles. All Rights Reserved.

require 'coveralls'
Coveralls.wear!

shared_context 'machine' do
  let(:communicate) {
    double('communicate')
  }
  let(:machine) {
    v = double('machine')
    v.tap { |m| m.stub(:communicate).and_return(communicate) }
  }
  let(:guest) {
    described_class.new
  }
end
