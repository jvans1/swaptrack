class SwapsController < ApplicationController
  # GET /swaps
  # GET /swaps.json
  def index
    @swaps = Swap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @swaps }
    end
  end

  # GET /swaps/1
  # GET /swaps/1.json
  def show
    @swap = Swap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @swap }
    end
  end

  # GET /swaps/new
  # GET /swaps/new.json
  def new
    @swap = Swap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @swap }
    end
  end

  # GET /swaps/1/edit
  def edit
    @swap = Swap.find(params[:id])
  end

  # POST /swaps
  # POST /swaps.json
  def create
    @swap = Swap.new(params[:swap])

    respond_to do |format|
      if @swap.save
        format.html { redirect_to @swap, notice: 'Swap was successfully created.' }
        format.json { render json: @swap, status: :created, location: @swap }
      else
        format.html { render action: "new" }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /swaps/1
  # PUT /swaps/1.json
  def update
    @swap = Swap.find(params[:id])

    respond_to do |format|
      if @swap.update_attributes(params[:swap])
        format.html { redirect_to @swap, notice: 'Swap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swaps/1
  # DELETE /swaps/1.json
  def destroy
    @swap = Swap.find(params[:id])
    @swap.destroy

    respond_to do |format|
      format.html { redirect_to swaps_url }
      format.json { head :no_content }
    end
  end
end
