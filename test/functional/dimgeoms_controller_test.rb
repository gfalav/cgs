require 'test_helper'

class DimgeomsControllerTest < ActionController::TestCase
  setup do
    @dimgeom = dimgeoms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dimgeoms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dimgeom" do
    assert_difference('Dimgeom.count') do
      post :create, dimgeom: { dconds: @dimgeom.dconds, dmens: @dimgeom.dmens, empot: @dimgeom.empot, fmax: @dimgeom.fmax, hci: @dimgeom.hci, hcm: @dimgeom.hcm, hcpr: @dimgeom.hcpr, hcs: @dimgeom.hcs, hl: @dimgeom.hl, hmi: @dimgeom.hmi, hmm: @dimgeom.hmm, hms: @dimgeom.hms, k: @dimgeom.k, lcadena: @dimgeom.lcadena, lcruceta: @dimgeom.lcruceta, lmensula: @dimgeom.lmensula, lpendulo: @dimgeom.lpendulo, lposte: @dimgeom.lposte, tramo_id: @dimgeom.tramo_id }
    end

    assert_redirected_to dimgeom_path(assigns(:dimgeom))
  end

  test "should show dimgeom" do
    get :show, id: @dimgeom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dimgeom
    assert_response :success
  end

  test "should update dimgeom" do
    put :update, id: @dimgeom, dimgeom: { dconds: @dimgeom.dconds, dmens: @dimgeom.dmens, empot: @dimgeom.empot, fmax: @dimgeom.fmax, hci: @dimgeom.hci, hcm: @dimgeom.hcm, hcpr: @dimgeom.hcpr, hcs: @dimgeom.hcs, hl: @dimgeom.hl, hmi: @dimgeom.hmi, hmm: @dimgeom.hmm, hms: @dimgeom.hms, k: @dimgeom.k, lcadena: @dimgeom.lcadena, lcruceta: @dimgeom.lcruceta, lmensula: @dimgeom.lmensula, lpendulo: @dimgeom.lpendulo, lposte: @dimgeom.lposte, tramo_id: @dimgeom.tramo_id }
    assert_redirected_to dimgeom_path(assigns(:dimgeom))
  end

  test "should destroy dimgeom" do
    assert_difference('Dimgeom.count', -1) do
      delete :destroy, id: @dimgeom
    end

    assert_redirected_to dimgeoms_path
  end
end
