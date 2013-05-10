# -*- encoding: utf-8 -*-
require 'rubygems'
require 'rake'
require 'rubygems/package_task'
require 'rspec'
require 'rspec/core'
require 'rspec/core/rake_task'

$:.unshift  File.join(File.dirname(__FILE__), "lib")

# Change "audit" to "attack" to go to attack mode
task :default => :audit

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec)

desc "Run only Audit Specs"
RSpec::Core::RakeTask.new(:audit) do |t|
  t.pattern = 'spec/rotten_apple/audit_spec.rb'
  t.verbose = true
end

desc "Run only Attack Specs"
RSpec::Core::RakeTask.new(:attack) do |t|
  t.pattern = 'spec/rotten_apple/attack_spec.rb'
  t.verbose = true
end

desc "Run only Common Specs"
RSpec::Core::RakeTask.new(:common) do |t|
  t.pattern = 'spec/rotten_apple/common_spec.rb'
  t.verbose = true
end