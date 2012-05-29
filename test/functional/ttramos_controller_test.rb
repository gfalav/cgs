require 'test_helper'

class TtramosControllerTest < ActionController::TestCase
  setup do
    @ttramo = ttramos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ttramos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ttramo" do
    assert_difference('Ttramo.count') do
      post :create, ttramo: { tipo: @ttramo.tipo }
    end

    assert_redirected_to ttramo_path(assigns(:ttramo))
  end

  test "should show ttramo" do
    get :show, id: @ttramo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ttramo
    assert_response :success
  end

  test "should update ttramo" do
    put :update, id: @ttramo, ttramo: { tipo: @ttramo.tipo }
    assert_redirected_to ttramo_path(assigns(:ttramo))
  end

  test "should destroy ttramo" do
    assert_difference('Ttramo.count', -1) do
      delete :destroy, id: @ttramo
    end

    assert_redirected_to ttramos_path
  end
end
