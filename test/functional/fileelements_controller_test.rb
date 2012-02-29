require 'test_helper'

class FileelementsControllerTest < ActionController::TestCase
  setup do
    @fileelement = fileelements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fileelements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fileelement" do
    assert_difference('Fileelement.count') do
      post :create, fileelement: @fileelement.attributes
    end

    assert_redirected_to fileelement_path(assigns(:fileelement))
  end

  test "should show fileelement" do
    get :show, id: @fileelement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fileelement
    assert_response :success
  end

  test "should update fileelement" do
    put :update, id: @fileelement, fileelement: @fileelement.attributes
    assert_redirected_to fileelement_path(assigns(:fileelement))
  end

  test "should destroy fileelement" do
    assert_difference('Fileelement.count', -1) do
      delete :destroy, id: @fileelement
    end

    assert_redirected_to fileelements_path
  end
end
