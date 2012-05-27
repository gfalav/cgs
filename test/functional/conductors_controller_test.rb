require 'test_helper'

class ConductorsControllerTest < ActionController::TestCase
  setup do
    @conductor = conductors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conductors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conductor" do
    assert_difference('Conductor.count') do
      post :create, conductor: { coef_e: @conductor.coef_e, coef_t: @conductor.coef_t, diametro: @conductor.diametro, imax: @conductor.imax, nombre: @conductor.nombre, peso: @conductor.peso, relec: @conductor.relec, rmec: @conductor.rmec, seccion: @conductor.seccion, tmax: @conductor.tmax, tmed: @conductor.tmed }
    end

    assert_redirected_to conductor_path(assigns(:conductor))
  end

  test "should show conductor" do
    get :show, id: @conductor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conductor
    assert_response :success
  end

  test "should update conductor" do
    put :update, id: @conductor, conductor: { coef_e: @conductor.coef_e, coef_t: @conductor.coef_t, diametro: @conductor.diametro, imax: @conductor.imax, nombre: @conductor.nombre, peso: @conductor.peso, relec: @conductor.relec, rmec: @conductor.rmec, seccion: @conductor.seccion, tmax: @conductor.tmax, tmed: @conductor.tmed }
    assert_redirected_to conductor_path(assigns(:conductor))
  end

  test "should destroy conductor" do
    assert_difference('Conductor.count', -1) do
      delete :destroy, id: @conductor
    end

    assert_redirected_to conductors_path
  end
end
