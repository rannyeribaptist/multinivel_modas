class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy, :authorize_payment]

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

    require 'mercadopago.rb'
    mp = MercadoPago.new('TEST-3769858112953753-062819-ef1a98b54f75c032cb0fad84f25da429-226272139')
    @payment_methods = mp.get("/v1/payment_methods")
  end

  def proccess_payment
    require 'mercadopago.rb'

    mp = MercadoPago.new('TEST-3769858112953753-062819-ef1a98b54f75c032cb0fad84f25da429-226272139')

    request = {
      "description" => params[:payment_description],
      "payment_method_id" => params[:payment_method_id],
      "payer" => {
        "email" => "#{current_user.email}",
        "first_name" => "#{current_user.name.split(" ").first}",
        "last_name" => "#{current_user.name.split(" ").last}",
        "identification" => {
          "type" => params[:docType],
          "number" => params[:docNumber]
        },
        "address" => {
          "zip_code" => "#{current_user.address.cep}",
          "street_name" => "#{current_user.address.street}",
          "street_number" => "#{current_user.address.number}",
          "neighborhood" => "#{current_user.address.neightbohood}",
          "city" => "#{current_user.address.city}",
          "federal_unit" => "#{current_user.address.state}"
        }
      }
    }

    if current_user.activated?
      request["transaction_amount"] = sum_items(current_user.shopping_cart)
    else
      request["transaction_amount"] = set_plan_value(current_user.plan).to_f
    end

    if not params[:purchase][:payment_method] == "ticket"
      request["token"] = "#{params[:token]}"
      request["installments"] = params[:installments].to_i
    end

    payment = mp.post('/v1/payments', request)

    puts payment

    if verify_payment_status(payment)
      @purchase = Purchase.new(
        user_id: current_user.id,
        address: current_user.address,
        payment_method: params[:purchase][:payment_method],
        status: payment["response"]["status"],
        status_detail: payment["response"]["status_detail"],
        payment_id: payment["response"]["id"],
        payment_method_reference_id: payment["response"]["transaction_details"]["payment_method_reference_id"],
        external_resource_url: payment["response"]["transaction_details"]["external_resource_url"]
      )

      if current_user.activated?
        @purchase.value = sum_items(current_user.shopping_cart)
        clear_shopping_cart(current_user.shopping_cart, @purchase)
      else
        if current_user.plan == "kit start"
          @pack = current_user.user_starter_pack.starter_pack
          @purchase.value = @pack.price
          @purchase.purchase_items.new(product_id: @pack.product_id, size: "", quantity: "1", status: "")
        else
          @purchase.value = set_plan_value(current_user.plan)
        end

        @purchase.kind = "account_validation"
        current_user.update_attribute(:activated, true) if payment["response"]["status"] == "approved"
      end

      @purchase.save

      redirect_to @purchase #, flash: {success: "Compra realizada com sucesso!"}
    else
      redirect_back(fallback_location: root_path, flash: { notice: payment_response(payment["response"]["status_detail"]) }) if payment["response"]["status_detail"].present?
      redirect_back(fallback_location: root_path, flash: { notice: payment_response(payment["response"]["status"]) }) if not payment["response"]["status_detail"].present?
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
    @purchase.user_id = current_user.id
    @purchase.address = current_user.address
    @purchase.value = sum_items(current_user.shopping_cart)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        clear_shopping_cart(current_user.shopping_cart, @purchase)
        # create_assemble(@purchase)
        # create_purchase_order(@purchase)
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

  def unauthorized_payments
    @purchases = Purchase.where(status: "Aguardando confirmação de pagamento")
  end

  def authorize_payment
    @purchase.update_attribute(:status, "Pagamento confirmado")
    respond_to do |format|
      format.html { redirect_to unauthorized_payments_url, flash: {success: 'Aprovado com sucesso.'} }
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
      params.require(:purchase).permit(:user_id, :payment_method, :value, :address_id, :status, :comprovant, :kind, :status_detail)
    end
end
