require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get info" do
    get :info
    assert_response :success
  end

end
