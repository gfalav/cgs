require 'test_helper'

class ProyectosControllerTest < ActionController::TestCase
  setup do
    @proyecto = proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyecto" do
    assert_difference('Proyecto.count') do
      post :create, proyecto: { comitente: @proyecto.comitente, cond_e_id: @proyecto.cond_e_id, cond_g_id: @proyecto.cond_g_id, constructor: @proyecto.constructor, desc: @proyecto.desc, dretmax: @proyecto.dretmax, expediente: @proyecto.expediente, fproyecto: @proyecto.fproyecto, proyectista: @proyecto.proyectista, proyecto: @proyecto.proyecto, tconstr_id: @proyecto.tconstr_id, ubicacion: @proyecto.ubicacion, vanomax: @proyecto.vanomax, zona_id: @proyecto.zona_id }
    end

    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  test "should show proyecto" do
    get :show, id: @proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyecto
    assert_response :success
  end

  test "should update proyecto" do
    put :update, id: @proyecto, proyecto: { comitente: @proyecto.comitente, cond_e_id: @proyecto.cond_e_id, cond_g_id: @proyecto.cond_g_id, constructor: @proyecto.constructor, desc: @proyecto.desc, dretmax: @proyecto.dretmax, expediente: @proyecto.expediente, fproyecto: @proyecto.fproyecto, proyectista: @proyecto.proyectista, proyecto: @proyecto.proyecto, tconstr_id: @proyecto.tconstr_id, ubicacion: @proyecto.ubicacion, vanomax: @proyecto.vanomax, zona_id: @proyecto.zona_id }
    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  test "should destroy proyecto" do
    assert_difference('Proyecto.count', -1) do
      delete :destroy, id: @proyecto
    end

    assert_redirected_to proyectos_path
  end
end
