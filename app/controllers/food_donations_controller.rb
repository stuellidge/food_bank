class FoodDonationsController < ApplicationController
  # GET /food_donations
  # GET /food_donations.json
  def index
    @food_donations = FoodDonation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_donations }
    end
  end

  # GET /food_donations/1
  # GET /food_donations/1.json
  def show
    @food_donation = FoodDonation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_donation }
    end
  end

  # GET /food_donations/new
  # GET /food_donations/new.json
  def new
    @food_donation = FoodDonation.new
    @food_donation.donated = Date.today
    @food_donation.food_donation_lines.build
    @food_donation.food_donation_lines.last.build_product
    
    if params[:donor]
      @food_donation.donor = Donor.find(params[:donor])
    end    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_donation }
    end
  end

  # GET /food_donations/1/edit
  def edit
    @food_donation = FoodDonation.find(params[:id])
    @food_donation.food_donation_lines.build
    @food_donation.food_donation_lines.last.build_product
  end

  # POST /food_donations
  # POST /food_donations.json
  def create    
    respond_to do |format|
      if create_food_donation
        format.html { redirect_to @food_donation, notice: 'Food donation was successfully created.' }
        format.json { render json: @food_donation, status: :created, location: @food_donation }
      else
        format.html { render action: "new" }
        format.json { render json: @food_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_donations/1
  # PUT /food_donations/1.json
  def update    
    @food_donation = FoodDonation.find(params[:id])
    
    respond_to do |format|
      if update_food_donation
        format.html { redirect_to @food_donation, notice: 'Food donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_donation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_food_donation
    begin
      process_new_food_donation_lines(params[:new_food_donation_lines])
      return @food_donation.update_attributes(params[:food_donation])
    rescue ActiveRecord::RecordInvalid => exc
      @food_donation.errors[:unexpected] = exc.message
      return false
    end
  end
  
  def create_food_donation
    begin
      @food_donation = FoodDonation.new(params[:food_donation])
      process_new_food_donation_lines(params[:new_food_donation_lines])
      return @food_donation.save
    rescue ActiveRecord::RecordInvalid => exc
      @food_donation.errors[:unexpected] = exc.message
      if @food_donation.food_donation_lines.empty?
        @food_donation.food_donation_lines.build
        @food_donation.food_donation_lines.last.build_product      
      end
      return false
    end
  end  

  # DELETE /food_donations/1
  # DELETE /food_donations/1.json
  def destroy
    @food_donation = FoodDonation.find(params[:id])
    @food_donation.destroy

    respond_to do |format|
      format.html { redirect_to food_donations_url }
      format.json { head :no_content }
    end
  end
  
  def process_new_food_donation_lines(h)    
    if(h)
      h.each_value do |food_donation_line|  
        if !is_empty(food_donation_line)          
          product = find_or_create_product(food_donation_line.delete(:product_attributes))
          line = @food_donation.food_donation_lines.build(food_donation_line)
          line.product = product
        end
      end
    end
  end
  
  def find_or_create_product(product_attributes)    
    Product.where(:id => product_attributes[:id]).first_or_create(product_attributes)
  end
  
  def is_empty(h) 
    h.each_value { |value|
      if value.is_a?(Hash) 
        return false if !is_empty(value)
      else
        return false if !value.empty?
      end      
    }
    return true
  end
end
