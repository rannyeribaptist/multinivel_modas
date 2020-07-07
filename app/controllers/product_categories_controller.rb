class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: [:destroy]
  before_action :authenticate_user!

  # POST /product_categorys
  # POST /product_categorys.json
  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_back(fallback_location: settings_path, flash: { notice: "Sucesso" }) }
        # format.json { render root_path, status: :created, location: @product_category }
      else
        format.html { redirect_back(fallback_location: settings_path, flash: { danger: "algo deu errado" }) }
        # format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_categorys/1
  # DELETE /product_categorys/1.json
  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: settings_path, flash: { notice: "Sucesso" }) }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_category_params
      params.require(:product_category).permit(:name, :icon, :id)
    end
end
