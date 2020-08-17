class StarterPacksController < ApplicationController
  before_action :set_starter_pack, only: [:show, :edit, :update, :destroy]

  # GET /starter_packs
  # GET /starter_packs.json
  def index
    @starter_packs = StarterPack.all
  end

  # GET /starter_packs/1
  # GET /starter_packs/1.json
  def show
  end

  # GET /starter_packs/new
  def new
    @starter_pack = StarterPack.new
  end

  # GET /starter_packs/1/edit
  def edit
  end

  # POST /starter_packs
  # POST /starter_packs.json
  def create
    @starter_pack = StarterPack.new(starter_pack_params)

    respond_to do |format|
      if @starter_pack.save
        format.html { redirect_to settings_url, notice: 'Starter pack was successfully created.' }
        format.json { render :show, status: :created, location: @starter_pack }
      else
        format.html { render :new }
        format.json { render json: @starter_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starter_packs/1
  # PATCH/PUT /starter_packs/1.json
  def update
    respond_to do |format|
      if @starter_pack.update(starter_pack_params)
        format.html { redirect_to settings_url, notice: 'Starter pack was successfully updated.' }
        format.json { render :show, status: :ok, location: @starter_pack }
      else
        format.html { render :edit }
        format.json { render json: @starter_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starter_packs/1
  # DELETE /starter_packs/1.json
  def destroy
    @starter_pack.destroy
    respond_to do |format|
      format.html { redirect_to settings_url, notice: 'Starter pack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starter_pack
      @starter_pack = StarterPack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def starter_pack_params
      params.require(:starter_pack).permit(:product_id, :price)
    end
end
