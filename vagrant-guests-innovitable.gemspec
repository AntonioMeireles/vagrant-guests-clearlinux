# encoding: UTF-8
# Copyright (c) 2017 Innovitable. All Rights Reserved.
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'vagrant-guests-innovitable/version'

Gem::Specification.new do |s|
  s.name = 'vagrant-guests-innovitable'
  s.version = VagrantPlugins::GuestInnovitable::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = 'Alex Sorkin'
  s.email = 'alexander.sorkin@gmail.com'
  s.homepage = 'https://github.com/alexsorkin/vagrant-guests-innovitable'
  s.license = 'APL2'
  s.summary = 'Innovitable Guest Plugin for Vagrant'
  s.description = 'Enables Vagrant to manage Innovitable machines.'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec-core', '~> 3.5.4'
  s.add_development_dependency 'rspec-expectations', '~> 3.5.0'
  s.add_development_dependency 'rspec-mocks', '~> 3.5.0'
  s.add_development_dependency 'rubocop'

  s.files = `git ls-files`.split($RS)
  s.executables = s.files.grep(/^bin/) { |f| File.basename(f) }
  s.test_files = s.files.grep(/^(test|spec|features)/)
  s.require_path = 'lib'
end
