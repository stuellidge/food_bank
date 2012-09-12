require 'test_helper'

class ReferringAgenciesControllerTest < ActionController::TestCase
  setup do
    @referring_agency = referring_agencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referring_agencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referring_agency" do
    assert_difference('ReferringAgency.count') do
      post :create, referring_agency: {  }
    end

    assert_redirected_to referring_agency_path(assigns(:referring_agency))
  end

  test "should show referring_agency" do
    get :show, id: @referring_agency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referring_agency
    assert_response :success
  end

  test "should update referring_agency" do
    put :update, id: @referring_agency, referring_agency: {  }
    assert_redirected_to referring_agency_path(assigns(:referring_agency))
  end

  test "should destroy referring_agency" do
    assert_difference('ReferringAgency.count', -1) do
      delete :destroy, id: @referring_agency
    end

    assert_redirected_to referring_agencies_path
  end
end
