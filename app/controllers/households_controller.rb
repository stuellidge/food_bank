class HouseholdsController < ApplicationController
  # GET /households
  # GET /households.json
  def index
    #@households = Household.paginate :include => "primary_occupant", :order => "occupants.surname, occupants.forename", :page => params[:page], :per_page => 10
    
    @households, @alphaParams = Household.all.alpha_paginate(params[:letter]){|household| household.primary_occupant.surname}
    
    all_houses = Household.all
    @autocomplete_items = all_houses.collect { |household| household.to_s }
    @household_matrix = Hash[all_houses.collect { |household| [household.to_s, household.id] }]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @households }
    end
  end

  # GET /households/1
  # GET /households/1.json
  def show
    @household = Household.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @household }
      format.xml { render xml: @household }
    end
  end

  # GET /households/new
  # GET /households/new.json
  def new
    @household = Household.new
    @household.referral_date = Date.today
    @household.build_address
    @household.build_primary_occupant
    @referral_date = Date.today

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @household }
    end
  end

  # GET /households/1/edit
  def edit
    @household = Household.find(params[:id])
  end

  # POST /households
  # POST /households.json
  def create
    @household = Household.new(params[:household])

    respond_to do |format|
      if @household.save
        format.html { redirect_to @household, notice: 'Household was successfully created.' }
        format.json { render json: @household, status: :created, location: @household }
      else
        format.html { render action: "new" }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /households/1
  # PUT /households/1.json
  def update
    @household = Household.find(params[:id])

    respond_to do |format|
      if @household.update_attributes(params[:household])
        format.html { redirect_to @household, notice: 'Household was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /households/1
  # DELETE /households/1.json
  def destroy
    @household = Household.find(params[:id])
    @household.destroy

    respond_to do |format|
      format.html { redirect_to households_url }
      format.json { head :no_content }
    end
  end  
end
