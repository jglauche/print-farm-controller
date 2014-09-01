require 'test_helper'

class PrintJobPositionsControllerTest < ActionController::TestCase
  setup do
    @print_job_position = print_job_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_job_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_job_position" do
    assert_difference('PrintJobPosition.count') do
      post :create, :print_job_position => @print_job_position.attributes
    end

    assert_redirected_to print_job_position_path(assigns(:print_job_position))
  end

  test "should show print_job_position" do
    get :show, :id => @print_job_position.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @print_job_position.to_param
    assert_response :success
  end

  test "should update print_job_position" do
    put :update, :id => @print_job_position.to_param, :print_job_position => @print_job_position.attributes
    assert_redirected_to print_job_position_path(assigns(:print_job_position))
  end

  test "should destroy print_job_position" do
    assert_difference('PrintJobPosition.count', -1) do
      delete :destroy, :id => @print_job_position.to_param
    end

    assert_redirected_to print_job_positions_path
  end
end
