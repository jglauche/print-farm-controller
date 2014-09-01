require 'test_helper'

class PrintMaterialsControllerTest < ActionController::TestCase
  setup do
    @print_material = print_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_material" do
    assert_difference('PrintMaterial.count') do
      post :create, :print_material => @print_material.attributes
    end

    assert_redirected_to print_material_path(assigns(:print_material))
  end

  test "should show print_material" do
    get :show, :id => @print_material.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @print_material.to_param
    assert_response :success
  end

  test "should update print_material" do
    put :update, :id => @print_material.to_param, :print_material => @print_material.attributes
    assert_redirected_to print_material_path(assigns(:print_material))
  end

  test "should destroy print_material" do
    assert_difference('PrintMaterial.count', -1) do
      delete :destroy, :id => @print_material.to_param
    end

    assert_redirected_to print_materials_path
  end
end
