class ActivationRequestsController < ApplicationController
  before_action :set_activation_request, only: [:show, :edit, :update, :destroy]

  # GET /activation_requests
  # GET /activation_requests.json
  def index
    @activation_requests = ActivationRequest.where(user_id: current_user.id)
  end

  # GET /activation_requests/1
  # GET /activation_requests/1.json
  def show
    @requester = User.find(@activation_request.requested_id)
    case @requester.plan
    when "consultor"
      @value = "10.00"
    when "revendedor"
      @value = "20.00"
    when "kit start"
      @value = @requester.user_starter_pack.starter_pack.price
    end
  end

  # GET /activation_requests/new
  def new
    @activation_request = ActivationRequest.new
  end

  # GET /activation_requests/1/edit
  def edit
  end

  # POST /activation_requests
  # POST /activation_requests.json
  def create
    @activation_request = ActivationRequest.new(activation_request_params)

    respond_to do |format|
      if @activation_request.save
        @activation_request.proccess_request
        format.html { redirect_back :fallback_location => root_path, notice: 'Requisição realizada com sucesso' }
        format.json { render :show, status: :created, location: @activation_request }
      else
        format.html { render :new }
        format.json { render json: @activation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activation_requests/1
  # PATCH/PUT /activation_requests/1.json
  def update
    respond_to do |format|
      if @activation_request.update(activation_request_params)
        format.html { redirect_back :fallback_location => root_path, notice: 'Sucesso' }
        format.json { render :show, status: :ok, location: @activation_request }
      else
        format.html { render :edit }
        format.json { render json: @activation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activation_requests/1
  # DELETE /activation_requests/1.json
  def destroy
    @activation_request.destroy
    respond_to do |format|
      format.html { redirect_to activation_requests_url, notice: 'Sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activation_request
      @activation_request = ActivationRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activation_request_params
      params.require(:activation_request).permit(:user_id, :requested_id)
    end
end
