class DimgeomsController < ApplicationController
  # GET /dimgeoms
  # GET /dimgeoms.json
  def index
    @dimgeoms = Dimgeom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dimgeoms }
    end
  end

  # GET /dimgeoms/1
  # GET /dimgeoms/1.json
  def show
    @dimgeom = Dimgeom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dimgeom }
    end
  end

  # GET /dimgeoms/new
  # GET /dimgeoms/new.json
  def new
    @dimgeom = Dimgeom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dimgeom }
    end
  end

  # GET /dimgeoms/1/edit
  def edit
    @dimgeom = Dimgeom.find(params[:id])
  end

  # POST /dimgeoms
  # POST /dimgeoms.json
  def create
    @dimgeom = Dimgeom.new(params[:dimgeom])

    respond_to do |format|
      if @dimgeom.save
        format.html { redirect_to @dimgeom, notice: 'Dimgeom was successfully created.' }
        format.json { render json: @dimgeom, status: :created, location: @dimgeom }
      else
        format.html { render action: "new" }
        format.json { render json: @dimgeom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dimgeoms/1
  # PUT /dimgeoms/1.json
  def update
    @dimgeom = Dimgeom.find(params[:id])

    respond_to do |format|
      if @dimgeom.update_attributes(params[:dimgeom])
        format.html { redirect_to @dimgeom, notice: 'Dimgeom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dimgeom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dimgeoms/1
  # DELETE /dimgeoms/1.json
  def destroy
    @dimgeom = Dimgeom.find(params[:id])
    @dimgeom.destroy

    respond_to do |format|
      format.html { redirect_to dimgeoms_url }
      format.json { head :no_content }
    end
  end
end
