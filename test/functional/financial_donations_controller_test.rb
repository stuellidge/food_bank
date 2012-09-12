require 'test_helper'

class FinancialDonationsControllerTest < ActionController::TestCase
  setup do
    @financial_donation = financial_donations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:financial_donations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create financial_donation" do
    assert_difference('FinancialDonation.count') do
      post :create, financial_donation: { amount: @financial_donation.amount, donated: @financial_donation.donated, gift_aid: @financial_donation.gift_aid }
    end

    assert_redirected_to financial_donation_path(assigns(:financial_donation))
  end

  test "should show financial_donation" do
    get :show, id: @financial_donation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @financial_donation
    assert_response :success
  end

  test "should update financial_donation" do
    put :update, id: @financial_donation, financial_donation: { amount: @financial_donation.amount, donated: @financial_donation.donated, gift_aid: @financial_donation.gift_aid }
    assert_redirected_to financial_donation_path(assigns(:financial_donation))
  end

  test "should destroy financial_donation" do
    assert_difference('FinancialDonation.count', -1) do
      delete :destroy, id: @financial_donation
    end

    assert_redirected_to financial_donations_path
  end
end
