require 'test_helper'

class TconstrsControllerTest < ActionController::TestCase
  setup do
    @tconstr = tconstrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tconstrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tconstr" do
    assert_difference('Tconstr.count') do
      post :create, tconstr: { tipo: @tconstr.tipo }
    end

    assert_redirected_to tconstr_path(assigns(:tconstr))
  end

  test "should show tconstr" do
    get :show, id: @tconstr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tconstr
    assert_response :success
  end

  test "should update tconstr" do
    put :update, id: @tconstr, tconstr: { tipo: @tconstr.tipo }
    assert_redirected_to tconstr_path(assigns(:tconstr))
  end

  test "should destroy tconstr" do
    assert_difference('Tconstr.count', -1) do
      delete :destroy, id: @tconstr
    end

    assert_redirected_to tconstrs_path
  end
end
