# Include hook code here
require 'controllers/fitter_happier_controller'
controller_path = File.dirname(__FILE__) + '/lib/controllers'
$LOAD_PATH << controller_path

if defined?(ActiveSupport::Dependencies)
  ActiveSupport::Dependencies.load_paths << controller_path
else
  Dependencies.load_paths << controller_path
end
config.controller_paths << controller_path
