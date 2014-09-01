require 'test_helper'

class PrintModelsControllerTest < ActionController::TestCase
  setup do
    @print_model = print_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_model" do
    assert_difference('PrintModel.count') do
      post :create, :print_model => @print_model.attributes
    end

    assert_redirected_to print_model_path(assigns(:print_model))
  end

  test "should show print_model" do
    get :show, :id => @print_model.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @print_model.to_param
    assert_response :success
  end

  test "should update print_model" do
    put :update, :id => @print_model.to_param, :print_model => @print_model.attributes
    assert_redirected_to print_model_path(assigns(:print_model))
  end

  test "should destroy print_model" do
    assert_difference('PrintModel.count', -1) do
      delete :destroy, :id => @print_model.to_param
    end

    assert_redirected_to print_models_path
  end
end
