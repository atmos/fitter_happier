# Include hook code here
require 'controllers/fitter_happier_controller'
controller_path = File.dirname(__FILE__) + '/lib/controllers'
$LOAD_PATH << controller_path
ActiveSupport::Dependencies.load_paths << controller_path
config.controller_paths << controller_path
