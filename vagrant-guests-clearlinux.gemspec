# Copyright (c) 2018-2019 António Meireles. All Rights Reserved.
$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'vagrant-guests-clearlinux/version'

Gem::Specification.new do |s|
  s.name = 'vagrant-guests-clearlinux'
  s.version = VagrantPlugins::GuestClearLinux::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = 'António Meireles'
  s.email = 'antonio.meireles@reformi.st'
  s.homepage = 'https://github.com/AntonioMeireles/vagrant-guests-clearlinux'
  s.license = 'APL2'
  s.summary = 'Clear Linux Guest Plugin for Vagrant'
  s.description = 'Enables Vagrant to manage Clear Linux guests.'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec-core', '~> 3.5.4'
  s.add_development_dependency 'rspec-expectations', '~> 3.5.0'
  s.add_development_dependency 'rspec-mocks', '~> 3.5.0'
  s.add_development_dependency 'rubocop'

  s.add_dependency 'tzinfo'
  s.add_dependency 'tzinfo-data'

  s.files = `git ls-files`.split($RS)
  s.executables = s.files.grep(/^bin/) { |f| File.basename(f) }
  s.test_files = s.files.grep(/^(test|spec|features)/)
  s.require_path = 'lib'
end
