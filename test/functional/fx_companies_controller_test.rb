require 'test_helper'

class FxCompaniesControllerTest < ActionController::TestCase
  setup do
    @fx_company = fx_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fx_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fx_company" do
    assert_difference('FxCompany.count') do
      post :create, fx_company: { name: @fx_company.name, url: @fx_company.url }
    end

    assert_redirected_to fx_company_path(assigns(:fx_company))
  end

  test "should show fx_company" do
    get :show, id: @fx_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fx_company
    assert_response :success
  end

  test "should update fx_company" do
    put :update, id: @fx_company, fx_company: { name: @fx_company.name, url: @fx_company.url }
    assert_redirected_to fx_company_path(assigns(:fx_company))
  end

  test "should destroy fx_company" do
    assert_difference('FxCompany.count', -1) do
      delete :destroy, id: @fx_company
    end

    assert_redirected_to fx_companies_path
  end
end
