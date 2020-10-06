require 'rails_helper'

RSpec.describe User, type: :model do
  # it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:role) }
  # it { should validate_presence_of(:graduation) }
  # it { should validate_presence_of(:level) }

  # it "should validate social secutiry number if not tax number" do
  #   user = User.new(name: "test", email: "test@test.com", role: "consultant", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123")
  #   user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #   user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   user.social_security_number = "000.000.000-00"
  #
  #   expect(user).to be_valid
  # end
  #
  # it "should validate tax number if not social security number" do
  #   user = User.new(name: "test", email: "test@test.com", role: "consultant", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123")
  #   user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #   user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   user.tax_number = "000.000.000-00"
  #
  #   expect(user).to be_valid
  # end
  #
  # it "should not validate if social secutiry number or tax number are empty" do
  #   user = User.new(name: "test", email: "test@test.com", role: "consultant", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123")
  #   user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #   user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   expect(user).not_to be_valid
  # end

  # it "should have a valid role" do
  #   user = User.new(name: "test", email: "test@test.com", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
  #   user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #   user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   user.role = "seller"
  #   expect(user).to be_valid
  #
  #   user.role = "consultant"
  #   expect(user).to be_valid
  #
  #   user.role = "client"
  #   expect(user).to be_valid
  #
  #   user.role = "franchise"
  #   expect(user).to be_valid
  #
  #   user.role = "test"
  #   expect(user).not_to be_valid
  # end

  # it "should not be an admin" do
  #   user = User.new(name: "test", email: "test@test.com", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
  #   user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #   user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   user.role = "admin"
  #   user.id = 1
  #
  #   user2 = User.new(name: "test", email: "test2@test.com", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
  #   user2.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user2.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #   user2.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   user2.role = "admin"
  #   user2.id = 2
  #
  #   expect(user).to be_valid
  #   expect(user2).not_to be_valid
  # end

  # TODO: Elaborate a proper way to test the levels of the business model
  it "should have a valid level" # idk how to properly test this...

  # it "should have a valid graduation" do
  #   user = User.new(name: "test", email: "test@test.com", role: "consultant", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
  #   user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #   user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   user.graduation = "sênior"
  #   expect(user).to be_valid
  #
  #   user.graduation = "bronze"
  #   expect(user).to be_valid
  #
  #   user.graduation = "prata"
  #   expect(user).to be_valid
  #
  #   user.graduation = "ouro"
  #   expect(user).to be_valid
  #
  #   user.graduation = "diamante"
  #   expect(user).to be_valid
  #
  #   user.graduation = "imperial"
  #   expect(user).to be_valid
  #
  #   user.graduation = "test"
  #   expect(user).not_to be_valid
  # end
  #
  # it "must have an address" do
  #   user = User.new(name: "test", email: "test@test.com", role: "consultant", level: "2", graduation: "ouro", password: "123123", password_confirmation: "123123", tax_number: "123123")
  #   user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #   user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   expect(user).not_to be_valid
  # end
  #
  # it "must have bank account information" do
  #   user = User.new(name: "test", email: "test@test.com", role: "consultant", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
  #   user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")
  #
  #   expect(user).not_to be_valid
  # end
  #
  # it "must have credit card information" do
  #   user = User.new(name: "test", email: "test@test.com", role: "consultant", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
  #   user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
  #   user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
  #
  #   expect(user).not_to be_valid
  # end

  # missing sub models that need to be created automatically for the user (not valid without address for example)

  context "activating user account with balance" do
    user = FactoryGirl.build(:user)
    user.balance = 10.0
    user.invitation_token = "321"
    user.social_security_number = "321"
    user.save!

    user2 = FactoryGirl.build(:user)
    user2.invitation_token = 123
    user2.social_security_number = 123
    user2.save!

    it "should not activate if balance is not enough" do
      user2.update_columns(:plan => "revendedor")
      user.activate_account_with_balance(user2)

      expect(user2.activated).not_to eq(true)
      expect(user.balance.to_f).to eq(10.0)
    end

    it "should set user account to active" do
      user2.update_columns(:plan => "consultor")
      user.activate_account_with_balance(user2)

      expect(user2.activated).to eq(true)
    end

    it "should compensate on user's balance" do
      user2.update_columns(:activated => false)
      user2.update_columns(:plan => "consultor")

      user.update_columns(:balance => 10.0)
      user.activate_account_with_balance(user2)

      expect(user.balance.to_f).to eq(0.0)
    end

    # context "starter_pack" do
    #   product = FactoryGirl.create(:product)
    #   starter_pack = FactoryGirl.build(:starter_pack)
    #   starter_pack.product = product
    #   starter_pack.save
    #
    #   user2.update_columns(:plan => "starter_pack")
    #   user2.build_user_starter_pack
    #   user2.user_starter_pack.starter_pack = starter_pack
    #   user2.save
    #
    #   it "set pack as paid" do
    #     user.activate_account_with_balance(user2)
    #   end
    # end
  end

end
