require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  context "requested" do
    it "should check if user have enough balance" do
      user = FactoryGirl.create(:user)
      user.update_columns(:balance => 120.00)

      withdraw = Withdraw.new(:status => "requested", :amount => 100.00, :user => user)
      expect(withdraw.save).to be_truthy
    end

    it "should proceed if amount is equal or higher than 90.00" do
      user = FactoryGirl.create(:user)
      user.update_columns(:balance => 90.00)

      withdraw = Withdraw.new(:status => "requested", :amount => 90.00, :user => user)
      expect(withdraw.save).to be_truthy
    end

    it "should not proceed if amount is lower than 90.00" do
      user = FactoryGirl.create(:user)
      user.update_columns(:balance => 90.00)

      withdraw = Withdraw.new(:status => "requested", :amount => 80.00, :user => user)
      expect(withdraw.save).not_to be_truthy
    end
  end

  context "amount is higher than user's balance" do
    it "can not proceed if balance is lower than the requested amount" do
      user = FactoryGirl.create(:user)
      user.update_columns(:balance => 80.00)

      withdraw = Withdraw.new(:status => "requested", :amount => 80.00, :user => user)
      expect(withdraw.save).not_to be_truthy
    end

    it "can proceed if balance is higher than the requested amount" do
      user = FactoryGirl.create(:user)
      user.update_columns(:balance => 90.00)

      withdraw = Withdraw.new(:status => "requested", :amount => 90.00, :user => user)
      expect(withdraw.save).to be_truthy
    end
  end
end
