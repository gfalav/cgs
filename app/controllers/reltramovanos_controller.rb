class ReltramovanosController < ApplicationController
  # GET /reltramovanos
  # GET /reltramovanos.json
  def index
    @reltramovanos = Reltramovano.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reltramovanos }
    end
  end

  # GET /reltramovanos/1
  # GET /reltramovanos/1.json
  def show
    @reltramovano = Reltramovano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reltramovano }
    end
  end

  # GET /reltramovanos/new
  # GET /reltramovanos/new.json
  def new
    @reltramovano = Reltramovano.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reltramovano }
    end
  end

  # GET /reltramovanos/1/edit
  def edit
    @reltramovano = Reltramovano.find(params[:id])
  end

  # POST /reltramovanos
  # POST /reltramovanos.json
  def create
    @reltramovano = Reltramovano.new(params[:reltramovano])

    respond_to do |format|
      if @reltramovano.save
        format.html { redirect_to @reltramovano, notice: 'Reltramovano was successfully created.' }
        format.json { render json: @reltramovano, status: :created, location: @reltramovano }
      else
        format.html { render action: "new" }
        format.json { render json: @reltramovano.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reltramovanos/1
  # PUT /reltramovanos/1.json
  def update
    @reltramovano = Reltramovano.find(params[:id])

    respond_to do |format|
      if @reltramovano.update_attributes(params[:reltramovano])
        format.html { redirect_to @reltramovano, notice: 'Reltramovano was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reltramovano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reltramovanos/1
  # DELETE /reltramovanos/1.json
  def destroy
    @reltramovano = Reltramovano.find(params[:id])
    @reltramovano.destroy

    respond_to do |format|
      format.html { redirect_to reltramovanos_url }
      format.json { head :no_content }
    end
  end
end
