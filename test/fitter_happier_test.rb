ENV['RAILS_ENV'] = 'test'
require File.expand_path(File.dirname(__FILE__) + '/../../../../test/test_helper')
require 'test_help'

class FitterHappierTest < ActionController::TestCase
  def setup
    @controller = FitterHappierController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_equal "", @response.session.session_id

    expected_body = "FitterHappier Site Check Passed"
    assert_match expected_body, @response.body
  end

  def test_site_check
    get :site_check
    assert_response :success
    assert_equal "", @response.session.session_id

    expected_body = %r{FitterHappier Site Check Passed @ [A-z]{3}, \d{2} [A-z]{3} \d{4} \d{2}:\d{2}:\d{2} [0-9\-]+}
    assert_match expected_body, @response.body
  end

  def test_site_and_database_check
    get :site_and_database_check
    assert_response :success
    assert_equal "", @response.session.session_id

    expected_body = %r{FitterHappier Site and Database Check Passed @ [A-z]{3}, \d{2} [A-z]{3} \d{4} \d{2}:\d{2}:\d{2} [0-9\-]+\nSchema Version: \d+}
    assert_match expected_body, @response.body
  end

  def test_routing_inclusion
    assert_routing('/fitter_happier', :controller => 'fitter_happier', :action => 'index')
    assert_routing('/fitter_happier/site_check', :controller => 'fitter_happier', :action => 'site_check')
    assert_routing('/fitter_happier/database_check', :controller => 'fitter_happier', :action => 'database_check')
  end
end
