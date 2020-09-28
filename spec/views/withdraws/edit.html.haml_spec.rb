require 'rails_helper'

RSpec.describe "withdraws/edit", type: :view do
  before(:each) do
    @withdraw = assign(:withdraw, Withdraw.create!(
      :amount => 1.5,
      :user => nil,
      :status => "MyString"
    ))
  end

  it "renders the edit withdraw form" do
    render

    assert_select "form[action=?][method=?]", withdraw_path(@withdraw), "post" do

      assert_select "input[name=?]", "withdraw[amount]"

      assert_select "input[name=?]", "withdraw[user_id]"

      assert_select "input[name=?]", "withdraw[status]"
    end
  end
end
