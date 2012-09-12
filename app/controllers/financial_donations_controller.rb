class FinancialDonationsController < ApplicationController
  # GET /financial_donations
  # GET /financial_donations.json
  def index
    @financial_donations = FinancialDonation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @financial_donations }
    end
  end

  # GET /financial_donations/1
  # GET /financial_donations/1.json
  def show
    @financial_donation = FinancialDonation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @financial_donation }
    end
  end

  # GET /financial_donations/new
  # GET /financial_donations/new.json
  def new
    @financial_donation = FinancialDonation.new
    @financial_donation.donated = Date.today
    
    if params[:donor]
      @financial_donation.donor = Donor.find(params[:donor])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @financial_donation }
    end
  end

  # GET /financial_donations/1/edit
  def edit
    @financial_donation = FinancialDonation.find(params[:id])
  end

  # POST /financial_donations
  # POST /financial_donations.json
  def create
    @financial_donation = FinancialDonation.new(params[:financial_donation])

    respond_to do |format|
      if @financial_donation.save
        format.html { redirect_to @financial_donation, notice: 'Financial donation was successfully created.' }
        format.json { render json: @financial_donation, status: :created, location: @financial_donation }
      else
        format.html { render action: "new" }
        format.json { render json: @financial_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /financial_donations/1
  # PUT /financial_donations/1.json
  def update
    @financial_donation = FinancialDonation.find(params[:id])

    respond_to do |format|
      if @financial_donation.update_attributes(params[:financial_donation])
        format.html { redirect_to @financial_donation, notice: 'Financial donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @financial_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_donations/1
  # DELETE /financial_donations/1.json
  def destroy
    @financial_donation = FinancialDonation.find(params[:id])
    @financial_donation.destroy

    respond_to do |format|
      format.html { redirect_to financial_donations_url }
      format.json { head :no_content }
    end
  end
end
