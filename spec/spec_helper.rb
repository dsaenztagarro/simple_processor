require_relative 'support/coveralls'
require_relative 'support/active_record'

require_relative '../lib/simple_processor'

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
  config.include RSpecMixin
end
