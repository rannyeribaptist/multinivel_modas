class ProductSizesController < ApplicationController
  before_action :set_product_size, only: [:destroy]
  before_action :authenticate_user!

  # POST /product_sizes
  # POST /product_sizes.json
  def create
    @product_size = ProductSize.new(product_size_params)

    respond_to do |format|
      if @product_size.save
        format.html { redirect_back(fallback_location: settings_path, flash: { notice: "Sucesso" }) }
        format.json { render root_path, status: :created, location: @product_size }
      else
        format.html { render :new }
        format.json { render json: @product_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sizes/1
  # DELETE /product_sizes/1.json
  def destroy
    @product_size.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: settings_path, flash: { notice: "Sucesso" }) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_size
      @product_size = ProductSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_size_params
      params.require(:product_size).permit(:size, :id)
    end
end
