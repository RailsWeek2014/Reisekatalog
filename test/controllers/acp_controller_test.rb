require 'test_helper'

class AcpControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
