class FoodParcelsController < ApplicationController
  # GET /food_parcels
  # GET /food_parcels.json
  def index
    @food_parcels = FoodParcel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_parcels }
    end
  end

  # GET /food_parcels/1
  # GET /food_parcels/1.json
  def show
    @food_parcel = FoodParcel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_parcel }
    end
  end

  # GET /food_parcels/new
  # GET /food_parcels/new.json
  def new
    @food_parcel = FoodParcel.new
    @food_parcel.date = Date.today
        
    if params[:household]
      @food_parcel.household = Household.find(params[:household])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_parcel }
    end
  end

  # GET /food_parcels/1/edit
  def edit
    @food_parcel = FoodParcel.find(params[:id])
  end

  # POST /food_parcels
  # POST /food_parcels.json
  def create
    @food_parcel = FoodParcel.new(params[:food_parcel])

    respond_to do |format|
      if @food_parcel.save
        format.html { redirect_to @food_parcel, notice: 'Food parcel was successfully created.' }
        format.json { render json: @food_parcel, status: :created, location: @food_parcel }
      else
        format.html { render action: "new" }
        format.json { render json: @food_parcel.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PUT /food_parcels/1
  # PUT /food_parcels/1.json
  def update
    @food_parcel = FoodParcel.find(params[:id])

    respond_to do |format|
      if @food_parcel.update_attributes(params[:food_parcel])
        format.html { redirect_to @food_parcel, notice: 'Food parcel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_parcel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_parcels/1
  # DELETE /food_parcels/1.json
  def destroy
    @food_parcel = FoodParcel.find(params[:id])
    @food_parcel.destroy

    respond_to do |format|
      format.html { redirect_to food_parcels_url }
      format.json { head :no_content }
    end
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
