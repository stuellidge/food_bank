require 'test_helper'

class FoodDonationLinesControllerTest < ActionController::TestCase
  setup do
    @food_donation_line = food_donation_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_donation_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_donation_line" do
    assert_difference('FoodDonationLine.count') do
      post :create, food_donation_line: { quantity: @food_donation_line.quantity }
    end

    assert_redirected_to food_donation_line_path(assigns(:food_donation_line))
  end

  test "should show food_donation_line" do
    get :show, id: @food_donation_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_donation_line
    assert_response :success
  end

  test "should update food_donation_line" do
    put :update, id: @food_donation_line, food_donation_line: { quantity: @food_donation_line.quantity }
    assert_redirected_to food_donation_line_path(assigns(:food_donation_line))
  end

  test "should destroy food_donation_line" do
    assert_difference('FoodDonationLine.count', -1) do
      delete :destroy, id: @food_donation_line
    end

    assert_redirected_to food_donation_lines_path
  end
end
