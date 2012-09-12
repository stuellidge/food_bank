require 'test_helper'

class FoodParcelsControllerTest < ActionController::TestCase
  setup do
    @food_parcel = food_parcels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_parcels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_parcel" do
    assert_difference('FoodParcel.count') do
      post :create, food_parcel: { date: @food_parcel.date }
    end

    assert_redirected_to food_parcel_path(assigns(:food_parcel))
  end

  test "should show food_parcel" do
    get :show, id: @food_parcel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_parcel
    assert_response :success
  end

  test "should update food_parcel" do
    put :update, id: @food_parcel, food_parcel: { date: @food_parcel.date }
    assert_redirected_to food_parcel_path(assigns(:food_parcel))
  end

  test "should destroy food_parcel" do
    assert_difference('FoodParcel.count', -1) do
      delete :destroy, id: @food_parcel
    end

    assert_redirected_to food_parcels_path
  end
end
