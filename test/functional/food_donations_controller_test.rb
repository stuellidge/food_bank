require 'test_helper'

class FoodDonationsControllerTest < ActionController::TestCase
  setup do
    @food_donation = food_donations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_donations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_donation" do
    assert_difference('FoodDonation.count') do
      post :create, food_donation: { donated: @food_donation.donated }
    end

    assert_redirected_to food_donation_path(assigns(:food_donation))
  end

  test "should show food_donation" do
    get :show, id: @food_donation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_donation
    assert_response :success
  end

  test "should update food_donation" do
    put :update, id: @food_donation, food_donation: { donated: @food_donation.donated }
    assert_redirected_to food_donation_path(assigns(:food_donation))
  end

  test "should destroy food_donation" do
    assert_difference('FoodDonation.count', -1) do
      delete :destroy, id: @food_donation
    end

    assert_redirected_to food_donations_path
  end
end
