class LastlongersController < ApplicationController
  # GET /lastlongers
  # GET /lastlongers.json
  def index
    @lastlongers = Lastlonger.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lastlongers }
    end
  end

  # GET /lastlongers/1
  # GET /lastlongers/1.json
  def show
    @lastlonger = Lastlonger.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lastlonger }
    end
  end

  # GET /lastlongers/new
  # GET /lastlongers/new.json
  def new
    @lastlonger = Lastlonger.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lastlonger }
    end
  end

  # GET /lastlongers/1/edit
  def edit
    @lastlonger = Lastlonger.find(params[:id])
  end

  # POST /lastlongers
  # POST /lastlongers.json
  def create
    @lastlonger = Lastlonger.new(params[:lastlonger])

    respond_to do |format|
      if @lastlonger.save
        format.html { redirect_to @lastlonger, notice: 'Lastlonger was successfully created.' }
        format.json { render json: @lastlonger, status: :created, location: @lastlonger }
      else
        format.html { render action: "new" }
        format.json { render json: @lastlonger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lastlongers/1
  # PUT /lastlongers/1.json
  def update
    @lastlonger = Lastlonger.find(params[:id])

    respond_to do |format|
      if @lastlonger.update_attributes(params[:lastlonger])
        format.html { redirect_to @lastlonger, notice: 'Lastlonger was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lastlonger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lastlongers/1
  # DELETE /lastlongers/1.json
  def destroy
    @lastlonger = Lastlonger.find(params[:id])
    @lastlonger.destroy

    respond_to do |format|
      format.html { redirect_to lastlongers_url }
      format.json { head :no_content }
    end
  end
end
