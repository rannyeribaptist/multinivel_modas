class AssembleOrdersController < ApplicationController
  before_action :set_assemble_order, only: [:show, :edit, :update, :destroy]

  # GET /assemble_orders
  # GET /assemble_orders.json
  def index
    @assemble_orders = AssembleOrder.where(user_id: current_user.id)
  end

  # GET /assemble_orders/1
  # GET /assemble_orders/1.json
  def show
  end

  # GET /assemble_orders/new
  def new
    @assemble_order = AssembleOrder.new
  end

  # GET /assemble_orders/1/edit
  def edit
  end

  # POST /assemble_orders
  # POST /assemble_orders.json
  def create
    @assemble_order = AssembleOrder.new(assemble_order_params)

    respond_to do |format|
      if @assemble_order.save
        format.html { redirect_to @assemble_order, notice: 'Assemble order was successfully created.' }
        format.json { render :show, status: :created, location: @assemble_order }
      else
        format.html { render :new }
        format.json { render json: @assemble_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assemble_orders/1
  # PATCH/PUT /assemble_orders/1.json
  def update
    respond_to do |format|
      if @assemble_order.update(assemble_order_params)
        format.html { redirect_to @assemble_order, notice: 'Assemble order was successfully updated.' }
        format.json { render :show, status: :ok, location: @assemble_order }
      else
        format.html { render :edit }
        format.json { render json: @assemble_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assemble_orders/1
  # DELETE /assemble_orders/1.json
  def destroy
    @assemble_order.destroy
    respond_to do |format|
      format.html { redirect_to assemble_orders_url, notice: 'Assemble order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assemble_order
      @assemble_order = AssembleOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assemble_order_params
      params.require(:assemble_order).permit(:purchase_id, :user_id, :status, :assemble_order_items_attributes => [:id, :status])
    end
end
