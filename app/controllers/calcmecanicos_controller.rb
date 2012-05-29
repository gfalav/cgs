class CalcmecanicosController < ApplicationController
  # GET /calcmecanicos
  # GET /calcmecanicos.json
  def index
    @calcmecanicos = Calcmecanico.where(:vano_id=>params[:vano_id]).order(:conductor_id, :condclima_id)
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calcmecanicos }
    end
  end

  # GET /calcmecanicos/1
  # GET /calcmecanicos/1.json
  def show
    @calcmecanico = Calcmecanico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calcmecanico }
    end
  end

  # GET /calcmecanicos/new
  # GET /calcmecanicos/new.json
  def new
    @calcmecanico = Calcmecanico.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calcmecanico }
    end
  end

  # GET /calcmecanicos/1/edit
  def edit
    @calcmecanico = Calcmecanico.find(params[:id])
  end

  # POST /calcmecanicos
  # POST /calcmecanicos.json
  def create
    @calcmecanico = Calcmecanico.new(params[:calcmecanico])

    respond_to do |format|
      if @calcmecanico.save
        format.html { redirect_to @calcmecanico, notice: 'Calcmecanico was successfully created.' }
        format.json { render json: @calcmecanico, status: :created, location: @calcmecanico }
      else
        format.html { render action: "new" }
        format.json { render json: @calcmecanico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calcmecanicos/1
  # PUT /calcmecanicos/1.json
  def update
    @calcmecanico = Calcmecanico.find(params[:id])

    respond_to do |format|
      if @calcmecanico.update_attributes(params[:calcmecanico])
        format.html { redirect_to @calcmecanico, notice: 'Calcmecanico was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calcmecanico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calcmecanicos/1
  # DELETE /calcmecanicos/1.json
  def destroy
    @calcmecanico = Calcmecanico.find(params[:id])
    @calcmecanico.destroy

    respond_to do |format|
      format.html { redirect_to calcmecanicos_url }
      format.json { head :no_content }
    end
  end
end
