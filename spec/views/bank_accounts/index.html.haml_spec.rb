require 'rails_helper'

RSpec.describe "bank_accounts/index", type: :view do
  before(:each) do
    assign(:bank_accounts, [
      BankAccount.create!(
        :agency => "Agency",
        :account_number => "Account Number",
        :type => "Type",
        :owner => "Owner",
        :registration_number => "Registration Number",
        :aditional_description => "Aditional Description"
      ),
      BankAccount.create!(
        :agency => "Agency",
        :account_number => "Account Number",
        :type => "Type",
        :owner => "Owner",
        :registration_number => "Registration Number",
        :aditional_description => "Aditional Description"
      )
    ])
  end

  it "renders a list of bank_accounts" do
    render
    assert_select "tr>td", :text => "Agency".to_s, :count => 2
    assert_select "tr>td", :text => "Account Number".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Owner".to_s, :count => 2
    assert_select "tr>td", :text => "Registration Number".to_s, :count => 2
    assert_select "tr>td", :text => "Aditional Description".to_s, :count => 2
  end
end
