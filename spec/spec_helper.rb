require 'pry'
require_relative 'support/coveralls'
require_relative 'support/active_record'
require_relative 'support/database_cleaner'

Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |path| require path }

require_relative 'support/dummy_app'
require_relative 'support/factory_girl'

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
  # config.include RSpecMixin
end
