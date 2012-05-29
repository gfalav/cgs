require 'test_helper'

class CalcmecanicosControllerTest < ActionController::TestCase
  setup do
    @calcmecanico = calcmecanicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calcmecanicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calcmecanico" do
    assert_difference('Calcmecanico.count') do
      post :create, calcmecanico: { condclima_id: @calcmecanico.condclima_id, conductor_id: @calcmecanico.conductor_id, flecha_h: @calcmecanico.flecha_h, flecha_t: @calcmecanico.flecha_t, flecha_v: @calcmecanico.flecha_v, hielo: @calcmecanico.hielo, temp: @calcmecanico.temp, tension: @calcmecanico.tension, tiro: @calcmecanico.tiro, vano_id: @calcmecanico.vano_id, viento: @calcmecanico.viento }
    end

    assert_redirected_to calcmecanico_path(assigns(:calcmecanico))
  end

  test "should show calcmecanico" do
    get :show, id: @calcmecanico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calcmecanico
    assert_response :success
  end

  test "should update calcmecanico" do
    put :update, id: @calcmecanico, calcmecanico: { condclima_id: @calcmecanico.condclima_id, conductor_id: @calcmecanico.conductor_id, flecha_h: @calcmecanico.flecha_h, flecha_t: @calcmecanico.flecha_t, flecha_v: @calcmecanico.flecha_v, hielo: @calcmecanico.hielo, temp: @calcmecanico.temp, tension: @calcmecanico.tension, tiro: @calcmecanico.tiro, vano_id: @calcmecanico.vano_id, viento: @calcmecanico.viento }
    assert_redirected_to calcmecanico_path(assigns(:calcmecanico))
  end

  test "should destroy calcmecanico" do
    assert_difference('Calcmecanico.count', -1) do
      delete :destroy, id: @calcmecanico
    end

    assert_redirected_to calcmecanicos_path
  end
end
