require 'test_helper'

class ContainerItemsControllerTest < ActionController::TestCase
  setup do
    @container_item = container_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:container_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create container_item" do
    assert_difference('ContainerItem.count') do
      post :create, :container_item => @container_item.attributes
    end

    assert_redirected_to container_item_path(assigns(:container_item))
  end

  test "should show container_item" do
    get :show, :id => @container_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @container_item.to_param
    assert_response :success
  end

  test "should update container_item" do
    put :update, :id => @container_item.to_param, :container_item => @container_item.attributes
    assert_redirected_to container_item_path(assigns(:container_item))
  end

  test "should destroy container_item" do
    assert_difference('ContainerItem.count', -1) do
      delete :destroy, :id => @container_item.to_param
    end

    assert_redirected_to container_items_path
  end
end
