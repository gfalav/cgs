require 'test_helper'

class TramosControllerTest < ActionController::TestCase
  setup do
    @tramo = tramos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tramos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tramo" do
    assert_difference('Tramo.count') do
      post :create, tramo: { cantidad: @tramo.cantidad, nombre: @tramo.nombre, proyecto_id: @tramo.proyecto_id, secuencia: @tramo.secuencia, ttramo_id: @tramo.ttramo_id }
    end

    assert_redirected_to tramo_path(assigns(:tramo))
  end

  test "should show tramo" do
    get :show, id: @tramo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tramo
    assert_response :success
  end

  test "should update tramo" do
    put :update, id: @tramo, tramo: { cantidad: @tramo.cantidad, nombre: @tramo.nombre, proyecto_id: @tramo.proyecto_id, secuencia: @tramo.secuencia, ttramo_id: @tramo.ttramo_id }
    assert_redirected_to tramo_path(assigns(:tramo))
  end

  test "should destroy tramo" do
    assert_difference('Tramo.count', -1) do
      delete :destroy, id: @tramo
    end

    assert_redirected_to tramos_path
  end
end
