class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  def proccess_payment
    require 'mercadopago.rb'

    mp = MercadoPago.new('TEST-3769858112953753-062819-ef1a98b54f75c032cb0fad84f25da429-226272139')

    request = {
        "token" => "#{params[:token]}",
        "installments" => params[:installments].to_i,
        "transaction_amount" => sum_items(current_user.shopping_cart),
        "payment_method_id" => params[:payment_method_id],
        "payer" => {
            "email" => "#{current_user.email}"
        }
    }

    payment = mp.post('/v1/payments', request)

    if payment["response"]["status"] == "approved"
      @purchase = Purchase.new(user_id: current_user.id, address: current_user.address, payment_method: params[:purchase][:payment_method], value: sum_items(current_user.shopping_cart), status: "Pagament aprovado")
      @purchase.save
      clear_shopping_cart(current_user.shopping_cart, @purchase)
      redirect_to @purchase, flash: {success: "Compra realizada com sucesso!"}
    elsif ["in_mediation", "in_proccess", "pending", "authorized"].include? payment["response"]["status"]
      @purchase = Purchase.new(user_id: current_user.id, address: current_user.address, payment_method: params[:purchase][:payment_method], value: sum_items(current_user.shopping_cart), status: "Pagament aguardando aprovação")
      @purchase.save
      clear_shopping_cart(current_user.shopping_cart, @purchase)
      redirect_to @purchase, flash: {warning: "Pedido realizado. Aguardando aprovação de pagamento."}
    else
      redirect_back(fallback_location: root_url, flash: { danger: "Pagamento não autorizado, motivo: " + payment["response"]["status_detail"].to_s })
    end

    @result = payment.to_json
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        clear_shopping_cart(current_user.shopping_cart, @purchase)
        # format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        # format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        # format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        # format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:user_id, :payment_method, :value, :address_id, :status, :comprovant)
    end
end
