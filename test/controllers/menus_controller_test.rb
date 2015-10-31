require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  test "should get estado" do
    get :estado
    assert_response :success
  end

  test "should get zona" do
    get :zona
    assert_response :success
  end

  test "should get subzona" do
    get :subzona
    assert_response :success
  end

end
