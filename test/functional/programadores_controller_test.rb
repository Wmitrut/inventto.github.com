require 'test_helper'

class ProgramadoresControllerTest < ActionController::TestCase
  setup do
    @programador = programadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create programador" do
    assert_difference('Programador.count') do
      post :create, programador: {  }
    end

    assert_redirected_to programador_path(assigns(:programador))
  end

  test "should show programador" do
    get :show, id: @programador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @programador
    assert_response :success
  end

  test "should update programador" do
    put :update, id: @programador, programador: {  }
    assert_redirected_to programador_path(assigns(:programador))
  end

  test "should destroy programador" do
    assert_difference('Programador.count', -1) do
      delete :destroy, id: @programador
    end

    assert_redirected_to programadores_path
  end
end
