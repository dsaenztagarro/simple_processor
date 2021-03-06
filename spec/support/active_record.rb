require 'active_record'
require 'yaml'

connection_info = YAML.load_file("spec/support/dummy_app/config/database.yml")["test"]
ActiveRecord::Base.establish_connection(connection_info)

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end
