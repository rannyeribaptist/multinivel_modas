require 'rails_helper'

RSpec.describe "withdraws/new", type: :view do
  before(:each) do
    assign(:withdraw, Withdraw.new(
      :amount => 1.5,
      :user => nil,
      :status => "MyString"
    ))
  end

  it "renders new withdraw form" do
    render

    assert_select "form[action=?][method=?]", withdraws_path, "post" do

      assert_select "input[name=?]", "withdraw[amount]"

      assert_select "input[name=?]", "withdraw[user_id]"

      assert_select "input[name=?]", "withdraw[status]"
    end
  end
end
