ENV['RAILS_ENV'] = 'test'
require '../../../../test/test_helper'

class FitterHappierTest < Test::Unit::TestCase
  def setup
    @controller = FitterHappierController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
  # Replace this with your real tests.
  def test_this_plugin
    get :index
    assert_response :success
    assert_equal "", @response.session.session_id
    assert_equal "Hai!", @response.body
  end
  
  def test_routing_inclusion
    assert_routing('/fitter_happier', :controller => 'fitter_happier', :action => 'index')
  end
end