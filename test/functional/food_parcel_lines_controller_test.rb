require 'test_helper'

class FoodParcelLinesControllerTest < ActionController::TestCase
  setup do
    @food_parcel_line = food_parcel_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_parcel_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_parcel_line" do
    assert_difference('FoodParcelLine.count') do
      post :create, food_parcel_line: {  }
    end

    assert_redirected_to food_parcel_line_path(assigns(:food_parcel_line))
  end

  test "should show food_parcel_line" do
    get :show, id: @food_parcel_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_parcel_line
    assert_response :success
  end

  test "should update food_parcel_line" do
    put :update, id: @food_parcel_line, food_parcel_line: {  }
    assert_redirected_to food_parcel_line_path(assigns(:food_parcel_line))
  end

  test "should destroy food_parcel_line" do
    assert_difference('FoodParcelLine.count', -1) do
      delete :destroy, id: @food_parcel_line
    end

    assert_redirected_to food_parcel_lines_path
  end
end
