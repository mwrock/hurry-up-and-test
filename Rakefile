#!/usr/bin/env rake
require 'rspec/core/rake_task'

desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec)

desc 'Run style and unit tests'
task default: [:spec]

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end

namespace :maintain do
  require 'stove/rake_task'
  Stove::RakeTask.new
end
