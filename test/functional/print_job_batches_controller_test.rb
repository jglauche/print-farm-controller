require 'test_helper'

class PrintJobBatchesControllerTest < ActionController::TestCase
  setup do
    @print_job_batch = print_job_batches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_job_batches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_job_batch" do
    assert_difference('PrintJobBatch.count') do
      post :create, :print_job_batch => @print_job_batch.attributes
    end

    assert_redirected_to print_job_batch_path(assigns(:print_job_batch))
  end

  test "should show print_job_batch" do
    get :show, :id => @print_job_batch.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @print_job_batch.to_param
    assert_response :success
  end

  test "should update print_job_batch" do
    put :update, :id => @print_job_batch.to_param, :print_job_batch => @print_job_batch.attributes
    assert_redirected_to print_job_batch_path(assigns(:print_job_batch))
  end

  test "should destroy print_job_batch" do
    assert_difference('PrintJobBatch.count', -1) do
      delete :destroy, :id => @print_job_batch.to_param
    end

    assert_redirected_to print_job_batches_path
  end
end
