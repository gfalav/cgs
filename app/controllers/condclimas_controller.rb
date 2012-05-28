class CondclimasController < ApplicationController
  # GET /condclimas
  # GET /condclimas.json
  def index
    @condclimas = Condclima.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @condclimas }
    end
  end

  # GET /condclimas/1
  # GET /condclimas/1.json
  def show
    @condclima = Condclima.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @condclima }
    end
  end

  # GET /condclimas/new
  # GET /condclimas/new.json
  def new
    @condclima = Condclima.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @condclima }
    end
  end

  # GET /condclimas/1/edit
  def edit
    @condclima = Condclima.find(params[:id])
  end

  # POST /condclimas
  # POST /condclimas.json
  def create
    @condclima = Condclima.new(params[:condclima])

    respond_to do |format|
      if @condclima.save
        format.html { redirect_to @condclima, notice: 'Condclima was successfully created.' }
        format.json { render json: @condclima, status: :created, location: @condclima }
      else
        format.html { render action: "new" }
        format.json { render json: @condclima.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /condclimas/1
  # PUT /condclimas/1.json
  def update
    @condclima = Condclima.find(params[:id])

    respond_to do |format|
      if @condclima.update_attributes(params[:condclima])
        format.html { redirect_to @condclima, notice: 'Condclima was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @condclima.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condclimas/1
  # DELETE /condclimas/1.json
  def destroy
    @condclima = Condclima.find(params[:id])
    @condclima.destroy

    respond_to do |format|
      format.html { redirect_to condclimas_url }
      format.json { head :no_content }
    end
  end
end
