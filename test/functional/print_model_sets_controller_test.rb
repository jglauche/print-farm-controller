require 'test_helper'

class PrintModelSetsControllerTest < ActionController::TestCase
  setup do
    @print_model_set = print_model_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_model_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_model_set" do
    assert_difference('PrintModelSet.count') do
      post :create, :print_model_set => @print_model_set.attributes
    end

    assert_redirected_to print_model_set_path(assigns(:print_model_set))
  end

  test "should show print_model_set" do
    get :show, :id => @print_model_set.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @print_model_set.to_param
    assert_response :success
  end

  test "should update print_model_set" do
    put :update, :id => @print_model_set.to_param, :print_model_set => @print_model_set.attributes
    assert_redirected_to print_model_set_path(assigns(:print_model_set))
  end

  test "should destroy print_model_set" do
    assert_difference('PrintModelSet.count', -1) do
      delete :destroy, :id => @print_model_set.to_param
    end

    assert_redirected_to print_model_sets_path
  end
end
