dummy_app_path = "#{File.dirname(__FILE__)}/dummy_app"

%w(app lib/handlers lib/processors).each do |folder|
  Dir["#{dummy_app_path}/#{folder}/**/*.rb"].each { |path| require path }
end
