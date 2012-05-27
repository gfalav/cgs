class ConductorsController < ApplicationController
  # GET /conductors
  # GET /conductors.json
  def index
    @conductors = Conductor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conductors }
    end
  end

  # GET /conductors/1
  # GET /conductors/1.json
  def show
    @conductor = Conductor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conductor }
    end
  end

  # GET /conductors/new
  # GET /conductors/new.json
  def new
    @conductor = Conductor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conductor }
    end
  end

  # GET /conductors/1/edit
  def edit
    @conductor = Conductor.find(params[:id])
  end

  # POST /conductors
  # POST /conductors.json
  def create
    @conductor = Conductor.new(params[:conductor])

    respond_to do |format|
      if @conductor.save
        format.html { redirect_to @conductor, notice: 'Conductor was successfully created.' }
        format.json { render json: @conductor, status: :created, location: @conductor }
      else
        format.html { render action: "new" }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conductors/1
  # PUT /conductors/1.json
  def update
    @conductor = Conductor.find(params[:id])

    respond_to do |format|
      if @conductor.update_attributes(params[:conductor])
        format.html { redirect_to @conductor, notice: 'Conductor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conductors/1
  # DELETE /conductors/1.json
  def destroy
    @conductor = Conductor.find(params[:id])
    @conductor.destroy

    respond_to do |format|
      format.html { redirect_to conductors_url }
      format.json { head :no_content }
    end
  end
end
