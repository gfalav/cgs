class TtramosController < ApplicationController
  # GET /ttramos
  # GET /ttramos.json
  def index
    @ttramos = Ttramo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ttramos }
    end
  end

  # GET /ttramos/1
  # GET /ttramos/1.json
  def show
    @ttramo = Ttramo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ttramo }
    end
  end

  # GET /ttramos/new
  # GET /ttramos/new.json
  def new
    @ttramo = Ttramo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ttramo }
    end
  end

  # GET /ttramos/1/edit
  def edit
    @ttramo = Ttramo.find(params[:id])
  end

  # POST /ttramos
  # POST /ttramos.json
  def create
    @ttramo = Ttramo.new(params[:ttramo])

    respond_to do |format|
      if @ttramo.save
        format.html { redirect_to @ttramo, notice: 'Ttramo was successfully created.' }
        format.json { render json: @ttramo, status: :created, location: @ttramo }
      else
        format.html { render action: "new" }
        format.json { render json: @ttramo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ttramos/1
  # PUT /ttramos/1.json
  def update
    @ttramo = Ttramo.find(params[:id])

    respond_to do |format|
      if @ttramo.update_attributes(params[:ttramo])
        format.html { redirect_to @ttramo, notice: 'Ttramo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ttramo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ttramos/1
  # DELETE /ttramos/1.json
  def destroy
    @ttramo = Ttramo.find(params[:id])
    @ttramo.destroy

    respond_to do |format|
      format.html { redirect_to ttramos_url }
      format.json { head :no_content }
    end
  end
end
