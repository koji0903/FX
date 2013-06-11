require 'test_helper'

class HistoricalsControllerTest < ActionController::TestCase
  setup do
    @historical = historicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historical" do
    assert_difference('Historical.count') do
      post :create, historical: { change: @historical.change, date: @historical.date, end: @historical.end, highest: @historical.highest, lowest: @historical.lowest, start: @historical.start }
    end

    assert_redirected_to historical_path(assigns(:historical))
  end

  test "should show historical" do
    get :show, id: @historical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historical
    assert_response :success
  end

  test "should update historical" do
    put :update, id: @historical, historical: { change: @historical.change, date: @historical.date, end: @historical.end, highest: @historical.highest, lowest: @historical.lowest, start: @historical.start }
    assert_redirected_to historical_path(assigns(:historical))
  end

  test "should destroy historical" do
    assert_difference('Historical.count', -1) do
      delete :destroy, id: @historical
    end

    assert_redirected_to historicals_path
  end
end
