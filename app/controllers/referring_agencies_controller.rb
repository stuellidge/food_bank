class ReferringAgenciesController < ApplicationController
  # GET /referring_agencies
  # GET /referring_agencies.json
  def index
    @referring_agencies = ReferringAgency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @referring_agencies }
    end
  end

  # GET /referring_agencies/1
  # GET /referring_agencies/1.json
  def show
    @referring_agency = ReferringAgency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @referring_agency }
    end
  end

  # GET /referring_agencies/new
  # GET /referring_agencies/new.json
  def new
    @referring_agency = ReferringAgency.new
    @referring_agency.build_address
    @referring_agency.build_contact_information

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @referring_agency }
    end
  end

  # GET /referring_agencies/1/edit
  def edit
    @referring_agency = ReferringAgency.find(params[:id])
  end

  # POST /referring_agencies
  # POST /referring_agencies.json
  def create
    @referring_agency = ReferringAgency.new(params[:referring_agency])

    respond_to do |format|
      if @referring_agency.save
        format.html { redirect_to @referring_agency, notice: 'Referring agency was successfully created.' }
        format.json { render json: @referring_agency, status: :created, location: @referring_agency }
      else
        format.html { render action: "new" }
        format.json { render json: @referring_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /referring_agencies/1
  # PUT /referring_agencies/1.json
  def update
    @referring_agency = ReferringAgency.find(params[:id])

    respond_to do |format|
      if @referring_agency.update_attributes(params[:referring_agency])
        format.html { redirect_to @referring_agency, notice: 'Referring agency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @referring_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referring_agencies/1
  # DELETE /referring_agencies/1.json
  def destroy
    @referring_agency = ReferringAgency.find(params[:id])
    @referring_agency.destroy

    respond_to do |format|
      format.html { redirect_to referring_agencies_url }
      format.json { head :no_content }
    end
  end
end
