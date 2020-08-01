class AssemblesController < ApplicationController
  before_action :set_assemble, only: [:show, :edit, :update, :destroy]

  # GET /assembles
  # GET /assembles.json
  def index
    @assembles = Assemble.all
  end

  # GET /assembles/1
  # GET /assembles/1.json
  def show
  end

  # GET /assembles/new
  def new
    @assemble = Assemble.new
  end

  # GET /assembles/1/edit
  def edit
  end

  # POST /assembles
  # POST /assembles.json
  def create
    @assemble = Assemble.new(assemble_params)

    respond_to do |format|
      if @assemble.save
        format.html { redirect_to @assemble, notice: 'Assemble was successfully created.' }
        format.json { render :show, status: :created, location: @assemble }
      else
        format.html { render :new }
        format.json { render json: @assemble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assembles/1
  # PATCH/PUT /assembles/1.json
  def update
    respond_to do |format|
      if @assemble.update(assemble_params)
        format.html { redirect_to @assemble, notice: 'Assemble was successfully updated.' }
        format.json { render :show, status: :ok, location: @assemble }
      else
        format.html { render :edit }
        format.json { render json: @assemble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assembles/1
  # DELETE /assembles/1.json
  def destroy
    @assemble.destroy
    respond_to do |format|
      format.html { redirect_to assembles_url, notice: 'Assemble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assemble
      @assemble = Assemble.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assemble_params
      params.require(:assemble).permit(:purchase_id, :user_id, :status)
    end
end
