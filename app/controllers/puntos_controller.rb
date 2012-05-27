class PuntosController < ApplicationController
  # GET /puntos
  # GET /puntos.json
  def index
    @puntos = Punto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @puntos }
    end
  end

  # GET /puntos/1
  # GET /puntos/1.json
  def show
    @punto = Punto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @punto }
    end
  end

  # GET /puntos/new
  # GET /puntos/new.json
  def new
    @punto = Punto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @punto }
    end
  end

  # GET /puntos/1/edit
  def edit
    @punto = Punto.find(params[:id])
  end

  # POST /puntos
  # POST /puntos.json
  def create
    @punto = Punto.new(params[:punto])

    respond_to do |format|
      if @punto.save
        format.html { redirect_to @punto, notice: 'Punto was successfully created.' }
        format.json { render json: @punto, status: :created, location: @punto }
      else
        format.html { render action: "new" }
        format.json { render json: @punto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /puntos/1
  # PUT /puntos/1.json
  def update
    @punto = Punto.find(params[:id])

    respond_to do |format|
      if @punto.update_attributes(params[:punto])
        format.html { redirect_to @punto, notice: 'Punto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @punto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puntos/1
  # DELETE /puntos/1.json
  def destroy
    @punto = Punto.find(params[:id])
    @punto.destroy

    respond_to do |format|
      format.html { redirect_to puntos_url }
      format.json { head :no_content }
    end
  end
end
