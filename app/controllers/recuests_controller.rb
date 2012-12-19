class RecuestsController < ApplicationController
  # GET /recuests
  # GET /recuests.json
  before_filter :login_required
  def index
    @pending_inbound_recuests = current_user.inbound_requests.select{|r| r.status == 0 }
    @inbound_requests = current_user.inbound_requests
    @outbound_requests = current_user.recuests
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recuests }
    end
  end

  # GET /recuests/1
  # GET /recuests/1.json
  def show
    @recuest = Recuest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recuest }
    end
  end

  # GET /recuests/new
  # GET /recuests/new.json
  def calendar
    @recuest = Swap.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recuest }
    end
  end

  # GET /recuests/1/edit
  def edit
    @recuest = Recuest.find(params[:id])

  end

  # POST /recuests
  # POST /recuests.json
  def create
    raise params.inspect
    case params[:type]
    when "Swap"
      @recuest = Swap.new 
    when "Piece"
      @recuest = Piece.new
    when "Lastlonger" 
      @recuest = Lastlonger.new
    end
    @recuest.user = current_user
    @recuest.tournament = Tournament.find(params[:tournaments])
    @recuest.receiver = User.find(params[:receivers])
    @recuest.percent = params[:percent].to_i
    @recuest.init
    respond_to do |format|
      if @recuest.save
        format.html { redirect_to user_path(current_user), notice: 'recuest was successfully created.' }
        format.json { render json: @recuest, status: :created, location: @recuest }
      else
        format.html { render "calender" }
        format.json { render json: @recuest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recuests/1
  # PUT /recuests/1.json
  def update
    @recuest = Recuest.find(params[:id])
    @receiver = @recuest.receiver
    @sender = @recuest.user
    respond_to do |format|
      if params[:status] == "Accept" #|| @recuest.update_attributes(params[:recuest])
        @recuest.accepted
        @recuest.save
        format.html { redirect_to user_path, notice: 'Request was accepted.' }
        format.json { head :no_content }
      elsif params[:status] =="Deny"
        @recuest.denied
        @recuest.save
        format.html { redirect_to user_path, notice: 'Request was denied.' }
        format.json { head :no_content }
      elsif params[:status] =="Edit"
        @recuest.edit
        @recuest.save
        format.html { redirect_to edit_user_path(@recuest), notice: 'Please Edit the request and send for approval' }
        format.json { head :no_content }
      elsif @recuest.updateable? && @recuest.update_attributes(params[:recuest])
        receiver = @recuest.user
        sender = @recuest.receiver 
        @recuest.save
        receiver.send_request(@recuest)
        format.html { redirect_to user_recuests_path, notice: 'edited recuest sent for approval.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recuest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recuests/1
  # DELETE /recuests/1.json
  def destroy
    @recuest = Recuest.find(params[:id])
    @recuest.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end
end
