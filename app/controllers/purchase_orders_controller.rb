class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy, :print_order]

  layout "print", only: :print_order

  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    if (current_user.role == "admin" or current_user.role == "aquisition")
      @purchase_orders = PurchaseOrder.all
    else
      @purchase_orders = PurchaseOrder.all.select{ |a| a.product.user.id == current_user.id }
    end
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
  end

  def print_order
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1
  # PATCH/PUT /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        if @purchase_order.status == "Entregue no ponto de apoio"
          @purchase_order.proccess_seller_balance
          format.html { redirect_to print_order_path(@purchase_order), notice: 'Sucesso' }
        else
          format.html { redirect_to @purchase_order, notice: 'Sucesso' }
        end

        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order.destroy
    respond_to do |format|
      format.html { redirect_to purchase_orders_url, notice: 'Purchase order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_params
      params.require(:purchase_order).permit(:product_id, :status, :value,
                                             :purchase_orders_items_attributes => [:size, :quantity])
    end
end
