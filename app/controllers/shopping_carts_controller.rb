class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: [:show, :add_item, :remove_item, :update]

  # GET /shopping_carts/1
  # GET /shopping_carts/1.json
  def show
  end

  def add_item
    @item = @shopping_cart.shopping_cart_items.new(:product_id => params[:product_id])
    @item.size = params[:size]
    @item.save

    respond_to do |format|
      format.js
    end
  end

  def remove_item
    ShoppingCartItem.find(params[:item_id]).destroy

    respond_to do |format|
      format.js
    end
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)

    respond_to do |format|
      if @shopping_cart.save
        format.html { redirect_to @shopping_cart, notice: 'Sucesso' }
        format.json { render :show, status: :created, location: @shopping_cart }
      else
        format.html { render :new }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def update
    respond_to do |format|
      if @shopping_cart.update(shopping_cart_params)
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart
      @shopping_cart = current_user.shopping_cart
    end

    # Only allow a list of trusted parameters through.
    def shopping_cart_params
      params.require(:shopping_cart).permit(:user_id, shopping_cart_items_attributes: [:id, :size, :quantity])
    end
end
