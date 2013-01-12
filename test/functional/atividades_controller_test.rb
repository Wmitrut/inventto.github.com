require 'test_helper'

class AtividadesControllerTest < ActionController::TestCase
  test "should get ver" do
    get :ver
    assert_response :success
  end

  test "should get lancar" do
    get :lancar
    assert_response :success
  end

end
