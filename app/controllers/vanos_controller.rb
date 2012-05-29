class VanosController < ApplicationController
  # GET /vanos
  # GET /vanos.json
  def index
    @vanos = Vano.where(:proyecto_id=>params[:proyecto_id])
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vanos }
    end
  end

  # GET /vanos/1
  # GET /vanos/1.json
  def show
    @vano = Vano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vano }
    end
  end

  # GET /vanos/new
  # GET /vanos/new.json
  def new
    @vano = Vano.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vano }
    end
  end

  # GET /vanos/1/edit
  def edit
    @vano = Vano.find(params[:id])
  end

  # POST /vanos
  # POST /vanos.json
  def create
    @vano = Vano.new(params[:vano])

    respond_to do |format|
      if @vano.save
        format.html { redirect_to @vano, notice: 'Vano was successfully created.' }
        format.json { render json: @vano, status: :created, location: @vano }
      else
        format.html { render action: "new" }
        format.json { render json: @vano.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vanos/1
  # PUT /vanos/1.json
  def update
    @vano = Vano.find(params[:id])

    respond_to do |format|
      if @vano.update_attributes(params[:vano])
        format.html { redirect_to @vano, notice: 'Vano was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vanos/1
  # DELETE /vanos/1.json
  def destroy
    @vano = Vano.find(params[:id])
    @vano.destroy

    respond_to do |format|
      format.html { redirect_to vanos_url }
      format.json { head :no_content }
    end
  end
end
