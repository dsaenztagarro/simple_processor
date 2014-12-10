require 'factory_girl'

FactoryGirl.definition_file_paths = %w{./spec/support/dummy_app/factories}
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
