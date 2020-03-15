require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:graduation) }
  it { should validate_presence_of(:level) }

  it "should validate social secutiry number if not tax number" do
    user = User.new(name: "test", email: "test@test.com", role: "consultant", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123")
    user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
    user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    user.social_security_number = "000.000.000-00"

    expect(user).to be_valid
  end

  it "should validate tax number if not social security number" do
    user = User.new(name: "test", email: "test@test.com", role: "consultant", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123")
    user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
    user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    user.tax_number = "000.000.000-00"

    expect(user).to be_valid
  end

  it "should not validate if social secutiry number or tax number are empty" do
    user = User.new(name: "test", email: "test@test.com", role: "consultant", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123")
    user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
    user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    expect(user).not_to be_valid
  end

  it "should have a valid role" do
    user = User.new(name: "test", email: "test@test.com", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
    user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
    user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    user.role = "seller"
    expect(user).to be_valid

    user.role = "consultant"
    expect(user).to be_valid

    user.role = "client"
    expect(user).to be_valid

    user.role = "franchise"
    expect(user).to be_valid

    user.role = "test"
    expect(user).not_to be_valid
  end

  it "should not be and admin" do
    user = User.new(name: "test", email: "test@test.com", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
    user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
    user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    user.role = "admin"
    user.id = 1

    user2 = User.new(name: "test", email: "test2@test.com", graduation: "ouro", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
    user2.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user2.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
    user2.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    user2.role = "admin"
    user2.id = 2

    expect(user).to be_valid
    expect(user2).not_to be_valid
  end

  # TODO: Elaborate a proper way to test the levels of the business model
  it "should have a valid level" # idk how to properly test this...

  it "should have a valid graduation" do
    user = User.new(name: "test", email: "test@test.com", role: "consultant", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
    user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
    user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    user.graduation = "sênior"
    expect(user).to be_valid

    user.graduation = "bronze"
    expect(user).to be_valid

    user.graduation = "prata"
    expect(user).to be_valid

    user.graduation = "ouro"
    expect(user).to be_valid

    user.graduation = "diamante"
    expect(user).to be_valid

    user.graduation = "imperial"
    expect(user).to be_valid

    user.graduation = "test"
    expect(user).not_to be_valid
  end

  it "must have an address" do
    user = User.new(name: "test", email: "test@test.com", role: "consultant", level: "2", graduation: "ouro", password: "123123", password_confirmation: "123123", tax_number: "123123")
    user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")
    user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    expect(user).not_to be_valid
  end

  it "must have bank account information" do
    user = User.new(name: "test", email: "test@test.com", role: "consultant", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
    user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user.build_credit_information(number: "test", name: "test", security_digit: "test", date: "test")

    expect(user).not_to be_valid
  end

  it "must have credit card information" do
    user = User.new(name: "test", email: "test@test.com", role: "consultant", level: "2", password: "123123", password_confirmation: "123123", tax_number: "123123")
    user.build_address(street: "test", neightbohood: "test", city: "test", state: "test", number: "test", cep: "test")
    user.build_bank_account_information(account_type: "test", account_number: "test", owner_name: "test", operation: "test", agency_number: "test")

    expect(user).not_to be_valid
  end

  # missing sub models that need to be created automatically for the user (not valid without address for example)
end
