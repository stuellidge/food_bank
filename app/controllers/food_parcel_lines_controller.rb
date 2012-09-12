class FoodParcelLinesController < ApplicationController
  # GET /food_parcel_lines
  # GET /food_parcel_lines.json
  def index
    @food_parcel_lines = FoodParcelLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_parcel_lines }
    end
  end

  # GET /food_parcel_lines/1
  # GET /food_parcel_lines/1.json
  def show
    @food_parcel_line = FoodParcelLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_parcel_line }
    end
  end

  # GET /food_parcel_lines/new
  # GET /food_parcel_lines/new.json
  def new
    @food_parcel_line = FoodParcelLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_parcel_line }
    end
  end

  # GET /food_parcel_lines/1/edit
  def edit
    @food_parcel_line = FoodParcelLine.find(params[:id])
  end

  # POST /food_parcel_lines
  # POST /food_parcel_lines.json
  def create
    @food_parcel_line = FoodParcelLine.new(params[:food_parcel_line])

    respond_to do |format|
      if @food_parcel_line.save
        format.html { redirect_to @food_parcel_line, notice: 'Food parcel line was successfully created.' }
        format.json { render json: @food_parcel_line, status: :created, location: @food_parcel_line }
      else
        format.html { render action: "new" }
        format.json { render json: @food_parcel_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_parcel_lines/1
  # PUT /food_parcel_lines/1.json
  def update
    @food_parcel_line = FoodParcelLine.find(params[:id])

    respond_to do |format|
      if @food_parcel_line.update_attributes(params[:food_parcel_line])
        format.html { redirect_to @food_parcel_line, notice: 'Food parcel line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_parcel_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_parcel_lines/1
  # DELETE /food_parcel_lines/1.json
  def destroy
    @food_parcel_line = FoodParcelLine.find(params[:id])
    @food_parcel_line.destroy

    respond_to do |format|
      format.js { head :no_content }
      format.html { redirect_to food_parcel_lines_url }
      format.json { head :no_content }
    end
  end
end
