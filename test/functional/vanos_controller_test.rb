require 'test_helper'

class VanosControllerTest < ActionController::TestCase
  setup do
    @vano = vanos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vanos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vano" do
    assert_difference('Vano.count') do
      post :create, vano: { cond_e_id: @vano.cond_e_id, cond_g_id: @vano.cond_g_id, flechamax_e: @vano.flechamax_e, flechamax_g: @vano.flechamax_g, nombre: @vano.nombre, proyecto_id: @vano.proyecto_id, tiromax_e: @vano.tiromax_e, tiromax_g: @vano.tiromax_g, tma_e: @vano.tma_e, tma_g: @vano.tma_g, vano: @vano.vano }
    end

    assert_redirected_to vano_path(assigns(:vano))
  end

  test "should show vano" do
    get :show, id: @vano
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vano
    assert_response :success
  end

  test "should update vano" do
    put :update, id: @vano, vano: { cond_e_id: @vano.cond_e_id, cond_g_id: @vano.cond_g_id, flechamax_e: @vano.flechamax_e, flechamax_g: @vano.flechamax_g, nombre: @vano.nombre, proyecto_id: @vano.proyecto_id, tiromax_e: @vano.tiromax_e, tiromax_g: @vano.tiromax_g, tma_e: @vano.tma_e, tma_g: @vano.tma_g, vano: @vano.vano }
    assert_redirected_to vano_path(assigns(:vano))
  end

  test "should destroy vano" do
    assert_difference('Vano.count', -1) do
      delete :destroy, id: @vano
    end

    assert_redirected_to vanos_path
  end
end
