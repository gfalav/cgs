class TconstrsController < ApplicationController
  # GET /tconstrs
  # GET /tconstrs.json
  def index
    @tconstrs = Tconstr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tconstrs }
    end
  end

  # GET /tconstrs/1
  # GET /tconstrs/1.json
  def show
    @tconstr = Tconstr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tconstr }
    end
  end

  # GET /tconstrs/new
  # GET /tconstrs/new.json
  def new
    @tconstr = Tconstr.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tconstr }
    end
  end

  # GET /tconstrs/1/edit
  def edit
    @tconstr = Tconstr.find(params[:id])
  end

  # POST /tconstrs
  # POST /tconstrs.json
  def create
    @tconstr = Tconstr.new(params[:tconstr])

    respond_to do |format|
      if @tconstr.save
        format.html { redirect_to @tconstr, notice: 'Tconstr was successfully created.' }
        format.json { render json: @tconstr, status: :created, location: @tconstr }
      else
        format.html { render action: "new" }
        format.json { render json: @tconstr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tconstrs/1
  # PUT /tconstrs/1.json
  def update
    @tconstr = Tconstr.find(params[:id])

    respond_to do |format|
      if @tconstr.update_attributes(params[:tconstr])
        format.html { redirect_to @tconstr, notice: 'Tconstr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tconstr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tconstrs/1
  # DELETE /tconstrs/1.json
  def destroy
    @tconstr = Tconstr.find(params[:id])
    @tconstr.destroy

    respond_to do |format|
      format.html { redirect_to tconstrs_url }
      format.json { head :no_content }
    end
  end
end
