class OtherOccupantsController < ApplicationController
  # GET /other_occupants
  # GET /other_occupants.json
  def index
    @household = Household.find(params[:household_id])
    @occupants = @household.other_occupants

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occupants }
    end
  end

  # GET /other_occupants/1
  # GET /other_occupants/1.json
  def show
    @household = Household.find(params[:household_id])
    @occupant = OtherOccupant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occupant }
    end
  end

  # GET /other_occupants/new
  # GET /other_occupants/new.json
  def new
    @household = Household.find(params[:household_id])
    @occupant = @household.other_occupants.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @occupant }
    end
  end

  # GET /other_occupants/1/edit
  def edit
    @household = Household.find(params[:household_id])
    @occupant = OtherOccupant.find(params[:id])
  end

  # POST /other_occupants
  # POST /other_occupants.json
  def create
    @household = Household.find(params[:household_id])
    @occupant = @household.other_occupants.build(params[:other_occupant])    

    respond_to do |format|
      if @occupant.save
        format.html { redirect_to :action => :index, notice: 'Occupant was successfully created.' }
        format.json { render json: @occupant, status: :created, location: @occupant }
      else
        format.html { render action: "new" }
        format.json { render json: @occupant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /other_occupants/1
  # PUT /other_occupants/1.json
  def update
    @household = Household.find(params[:household_id])
    @occupant = OtherOccupant.find(params[:id])

    respond_to do |format|
      if @occupant.update_attributes(params[:other_occupant])
        format.html { redirect_to [@household, @occupant], notice: 'Occupant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @occupant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_occupants/1
  # DELETE /other_occupants/1.json
  def destroy
    @household = Household.find(params[:household_id])
    @occupant = OtherOccupant.find(params[:id])
    @occupant.destroy

    respond_to do |format|
      format.html { redirect_to household_other_occupants_url }
      format.json { head :no_content }
    end
  end
end
