class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :define_admin, only: [:index, :new, :destroy]
  before_action :authenticate_user!
  before_action :validate_registration_of_current_user, only: [:show, :edit, :dashboard, :user_levels]
  before_action :validate_activation_of_current_user, only: [:show, :edit, :dashboard, :user_levels]
  skip_before_action :verify_authenticity_token, only: :update

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
    params[:user][:invited_ids] = params[:user][:invited_ids].split(" ")
    respond_to do |format|
      if @user.update(user_params)
        @user.update_attribute(:completed_registration, true) if current_user.address.present?
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.js
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
    @user.soft_delete

    if @user == current_user
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message :notice, :destroyed
      yield resource if block_given?
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    else
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        # format.json { head :no_content }
      end
    end
  end

  # complete the registration proccess
  def finish_registration
    if current_user.completed_registration?
      redirect_to user_dashboard_path
    else
      @user = current_user
      @user.build_address
      @user.build_credit_information
      @user.build_bank_account_information
    end
  end

  def validate_plan
    @purchase = Purchase.new(kind: "account_validation")
    @user = current_user

    require 'mercadopago.rb'
    mp = MercadoPago.new('APP_USR-3769858112953753-062819-8795743aed7216c004ddec60d8b1ae41-226272139')
    @payment_methods = mp.get("/v1/payment_methods")
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
      params.require(:user).permit(:name, :role, :graduation, :level, :avatar, :phone,  :sales_volume, :social_security_number, :tax_number, :invitation_token, :invited_by_id, :invited_by_token, :plan, :activated, :completed_registration, :balance, :invited_by_id, :invited_ids, :invited_ids => [],
                                   :address_attributes => [:id, :street, :neightbohood, :city, :state, :number, :complement, :cep],
                                   :bank_account_information_attributes => [:id, :account_number, :owner_name, :operation, :account_type, :agency_number],
                                   :credit_information_attributes => [:id, :number, :name, :security_digit, :date],
                                   :user_starter_pack_attributes => [:id, :starter_pack_id, :user_id])
    end
end
