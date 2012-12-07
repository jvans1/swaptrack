
class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.json
  before_filter :login_required
  def index
    @inbound_requests = current_user.inbound_requests
    @outbound_requests = current_user.requests
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])

  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request].except(:user, :tournament))
    @request.user = current_user
    @request.receiver = User.find_by_name(params[:name])
    @request.init
    respond_to do |format|
      if @request.save
        format.html { redirect_to user_requests_path, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])
    @receiver = @request.receiver
    @sender = @request.user
    respond_to do |format|
      if params[:status] == "Accept" #|| @request.update_attributes(params[:request])
        @request.accepted
        @request.save
        format.html { redirect_to user_requests_path, notice: 'Request was accepted.' }
        format.json { head :no_content }
      elsif params[:status] =="Deny"
        @request.denied
        @request.save
        format.html { redirect_to user_requests_path, notice: 'Request was denied.' }
        format.json { head :no_content }
      elsif params[:status] =="Edit"
        @request.edit
        @request.save
        format.html { redirect_to edit_user_request_path(@request), notice: 'Please Edit the request and send for approval' }
        format.json { head :no_content }
      elsif @request.updateable? && @request.update_attributes(params[:request])
        receiver = @request.user
        sender = @request.receiver 
        @request.save
        receiver.send_request(@request)
        format.html { redirect_to user_requests_path, notice: 'edited request sent for approval.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end
end
