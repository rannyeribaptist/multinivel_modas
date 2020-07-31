require 'rails_helper'

RSpec.describe "purchases/new", type: :view do
  before(:each) do
    assign(:purchase, Purchase.new(
      :user => nil,
      :payment_method => "MyString",
      :value => "MyString",
      :address => nil
    ))
  end

  it "renders new purchase form" do
    render

    assert_select "form[action=?][method=?]", purchases_path, "post" do

      assert_select "input[name=?]", "purchase[user_id]"

      assert_select "input[name=?]", "purchase[payment_method]"

      assert_select "input[name=?]", "purchase[value]"

      assert_select "input[name=?]", "purchase[address_id]"
    end
  end
end
