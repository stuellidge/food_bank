class FoodDonationLinesController < ApplicationController
  # GET /food_donation_lines
  # GET /food_donation_lines.json
  def index
    @food_donation_lines = FoodDonationLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_donation_lines }
    end
  end

  # GET /food_donation_lines/1
  # GET /food_donation_lines/1.json
  def show
    @food_donation_line = FoodDonationLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_donation_line }
    end
  end

  # GET /food_donation_lines/new
  # GET /food_donation_lines/new.json
  def new
    @food_donation_line = FoodDonationLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_donation_line }
    end
  end

  # GET /food_donation_lines/1/edit
  def edit
    @food_donation_line = FoodDonationLine.find(params[:id])
  end

  # POST /food_donation_lines
  # POST /food_donation_lines.json
  def create
    @food_donation_line = FoodDonationLine.new(params[:food_donation_line])

    respond_to do |format|
      if @food_donation_line.save
        format.html { redirect_to @food_donation_line, notice: 'Food donation line was successfully created.' }
        format.json { render json: @food_donation_line, status: :created, location: @food_donation_line }
      else
        format.html { render action: "new" }
        format.json { render json: @food_donation_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_donation_lines/1
  # PUT /food_donation_lines/1.json
  def update
    @food_donation_line = FoodDonationLine.find(params[:id])

    respond_to do |format|
      if @food_donation_line.update_attributes(params[:food_donation_line])
        format.html { redirect_to @food_donation_line, notice: 'Food donation line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_donation_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_donation_lines/1
  # DELETE /food_donation_lines/1.json
  def destroy
    @food_donation_line = FoodDonationLine.find(params[:id])
    @food_donation_line.destroy

    respond_to do |format|
      format.js { head :no_content }
      format.html { redirect_to food_donation_lines_url }
      format.json { head :no_content }
    end
  end
end
