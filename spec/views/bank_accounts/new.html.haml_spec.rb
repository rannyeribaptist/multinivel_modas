require 'rails_helper'

RSpec.describe "bank_accounts/new", type: :view do
  before(:each) do
    assign(:bank_account, BankAccount.new(
      :agency => "MyString",
      :account_number => "MyString",
      :type => "",
      :owner => "MyString",
      :registration_number => "MyString",
      :aditional_description => "MyString"
    ))
  end

  it "renders new bank_account form" do
    render

    assert_select "form[action=?][method=?]", bank_accounts_path, "post" do

      assert_select "input[name=?]", "bank_account[agency]"

      assert_select "input[name=?]", "bank_account[account_number]"

      assert_select "input[name=?]", "bank_account[type]"

      assert_select "input[name=?]", "bank_account[owner]"

      assert_select "input[name=?]", "bank_account[registration_number]"

      assert_select "input[name=?]", "bank_account[aditional_description]"
    end
  end
end
