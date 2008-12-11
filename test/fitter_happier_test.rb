ENV['RAILS_ENV'] = 'test'
require File.expand_path(File.dirname(__FILE__) + '/../../../../test/test_helper')

class FitterHappierTest < Test::Unit::TestCase
  def setup
    @controller = FitterHappierController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
  def test_this_plugin
    get :index
    assert_response :success
    assert_equal "", @response.session.session_id
    
    expected_body = %r{Mongrel and Database Check Passed @ [A-z]{3}, \d{2} [A-z]{3} \d{4} \d{2}:\d{2}:\d{2} [0-9\-]+ -- Schema Version: \d+}
    assert_match expected_body, @response.body
  end
  
  def test_routing_inclusion
    assert_routing('/fitter_happier', :controller => 'fitter_happier', :action => 'index')
  end
end