# Include hook code here
require 'controllers/fitter_happier_controller'
controller_path = File.dirname(__FILE__) + '/lib/controllers'
$LOAD_PATH << controller_path

if defined?(ActiveSupport::Dependencies)
  if Rails::VERSION::MAJOR >= 3
    ActiveSupport::Dependencies.autoload_paths << controller_path
  else
    ActiveSupport::Dependencies.load_paths << controller_path
  end
else
  Dependencies.load_paths << controller_path
end

if Rails::VERSION::MAJOR >= 3
  paths.app.controllers << controller_path
else
  config.controller_paths << controller_path
end
