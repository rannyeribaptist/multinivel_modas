require 'rails_helper'

RSpec.describe "bank_accounts/edit", type: :view do
  before(:each) do
    @bank_account = assign(:bank_account, BankAccount.create!(
      :agency => "MyString",
      :account_number => "MyString",
      :type => "",
      :owner => "MyString",
      :registration_number => "MyString",
      :aditional_description => "MyString"
    ))
  end

  it "renders the edit bank_account form" do
    render

    assert_select "form[action=?][method=?]", bank_account_path(@bank_account), "post" do

      assert_select "input[name=?]", "bank_account[agency]"

      assert_select "input[name=?]", "bank_account[account_number]"

      assert_select "input[name=?]", "bank_account[type]"

      assert_select "input[name=?]", "bank_account[owner]"

      assert_select "input[name=?]", "bank_account[registration_number]"

      assert_select "input[name=?]", "bank_account[aditional_description]"
    end
  end
end
