require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'sinatra/activerecord/rake'

require 'active_record'
require 'yaml'
connection_info = YAML.load_file("spec/support/dummy_app/config/database.yml")["test"]
ActiveRecord::Base.establish_connection(connection_info)

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
end

RSpec::Core::RakeTask.new :specs do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

task default: ['specs']

