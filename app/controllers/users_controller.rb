class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :define_admin, only: [:index, :new, :destroy]
  before_action :authenticate_user!
  before_action :validate_registration_of_current_user, only: [:show, :edit, :dashboard, :user_levels]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, flash: { danger: 'Verifique todos os dados e tente novamente'} }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  # complete the registration proccess
  def finish_registration
    if current_user.address.present?
      redirect_to user_dashboard_path
    else
      @user = current_user
      @user.build_address
      @user.build_credit_information
      @user.build_bank_account_information
    end
  end

  def dashboard
    @user = current_user
  end

  def user_levels
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :role, :graduation, :level, :avatar, :phone,  :sales_volume, :social_security_number, :tax_number, :invitation_token, :invited_by_id, :invited_by_token, :invited_ids => [],
                                   :address_attributes => [:id, :street, :neightbohood, :city, :state, :number, :complement, :cep],
                                   :bank_account_information_attributes => [:id, :account_number, :owner_name, :operation, :account_type, :agency_number],
                                   :credit_information_attributes => [:id, :number, :name, :security_digit, :date])
    end
end
