class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.build_order_address
    @order.order_items.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    # if @order.xml_file.present?
    #   require 'json'
    #   require 'active_support/core_ext'
    #
    #   order_data = Hash.from_xml(@order.xml_file).to_json
    #   puts "AAAAAAAAAAAAA"
    #   puts order_data
    #   puts "AAAAAAAAAAAAA"
    # end

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }

        create_assemble(@order)
        create_purchase_order(@order)
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        if params[:order][:order_items_attributes]["0"]["status"] == "Adicionado"
          update_product_quantity(params[:order][:order_items_attributes]["0"][:id])
        end

        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:xml_file, :order_identification, :client_name, :client_email, :client_id, :client_phone, :date, :status, :value,
                                    :order_items_attributes => [:item_name, :id, :_destroy, :item_option, :order_id, :quantity, :status, :product_reference, :value],
                                    :order_address_attributes => [:id, :street, :neighbohood, :city, :state, :number, :complement, :cep])
    end
end
