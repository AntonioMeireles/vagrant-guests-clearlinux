# Copyright (c) 2018 António Meireles. All Rights Reserved.

require 'coveralls'
Coveralls.wear!

shared_context 'machine' do
  let(:communicate) do
    double('communicate')
  end
  let(:machine) do
    v = double('machine')
    v.tap { |m| m.stub(:communicate).and_return(communicate) }
  end
  let(:guest) do
    described_class.new
  end
end
