require 'test_helper'

class PrintModelSetPositionsControllerTest < ActionController::TestCase
  setup do
    @print_model_set_position = print_model_set_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_model_set_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_model_set_position" do
    assert_difference('PrintModelSetPosition.count') do
      post :create, :print_model_set_position => @print_model_set_position.attributes
    end

    assert_redirected_to print_model_set_position_path(assigns(:print_model_set_position))
  end

  test "should show print_model_set_position" do
    get :show, :id => @print_model_set_position.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @print_model_set_position.to_param
    assert_response :success
  end

  test "should update print_model_set_position" do
    put :update, :id => @print_model_set_position.to_param, :print_model_set_position => @print_model_set_position.attributes
    assert_redirected_to print_model_set_position_path(assigns(:print_model_set_position))
  end

  test "should destroy print_model_set_position" do
    assert_difference('PrintModelSetPosition.count', -1) do
      delete :destroy, :id => @print_model_set_position.to_param
    end

    assert_redirected_to print_model_set_positions_path
  end
end
