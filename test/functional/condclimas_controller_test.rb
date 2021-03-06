require 'test_helper'

class CondclimasControllerTest < ActionController::TestCase
  setup do
    @condclima = condclimas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:condclimas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create condclima" do
    assert_difference('Condclima.count') do
      post :create, condclima: { hielo: @condclima.hielo, nombre: @condclima.nombre, temp: @condclima.temp, viento: @condclima.viento, zona_id: @condclima.zona_id }
    end

    assert_redirected_to condclima_path(assigns(:condclima))
  end

  test "should show condclima" do
    get :show, id: @condclima
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @condclima
    assert_response :success
  end

  test "should update condclima" do
    put :update, id: @condclima, condclima: { hielo: @condclima.hielo, nombre: @condclima.nombre, temp: @condclima.temp, viento: @condclima.viento, zona_id: @condclima.zona_id }
    assert_redirected_to condclima_path(assigns(:condclima))
  end

  test "should destroy condclima" do
    assert_difference('Condclima.count', -1) do
      delete :destroy, id: @condclima
    end

    assert_redirected_to condclimas_path
  end
end
