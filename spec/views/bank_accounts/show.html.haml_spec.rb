require 'rails_helper'

RSpec.describe "bank_accounts/show", type: :view do
  before(:each) do
    @bank_account = assign(:bank_account, BankAccount.create!(
      :agency => "Agency",
      :account_number => "Account Number",
      :type => "Type",
      :owner => "Owner",
      :registration_number => "Registration Number",
      :aditional_description => "Aditional Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Agency/)
    expect(rendered).to match(/Account Number/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Owner/)
    expect(rendered).to match(/Registration Number/)
    expect(rendered).to match(/Aditional Description/)
  end
end
