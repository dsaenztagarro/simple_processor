require_relative 'support/coveralls'
require_relative 'support/active_record'
require_relative '../lib/simple_processor'
require 'pry'

dummy_app_path = "#{File.dirname(__FILE__)}/support/dummy_app"
%w(handlers processors).each do |folder|
  Dir["#{dummy_app_path}/lib/#{folder}/*.rb"].each { |path| require path }
end

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
  # config.include RSpecMixin
end
