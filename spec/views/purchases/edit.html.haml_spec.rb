require 'rails_helper'

RSpec.describe "purchases/edit", type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
      :user => nil,
      :payment_method => "MyString",
      :value => "MyString",
      :address => nil
    ))
  end

  it "renders the edit purchase form" do
    render

    assert_select "form[action=?][method=?]", purchase_path(@purchase), "post" do

      assert_select "input[name=?]", "purchase[user_id]"

      assert_select "input[name=?]", "purchase[payment_method]"

      assert_select "input[name=?]", "purchase[value]"

      assert_select "input[name=?]", "purchase[address_id]"
    end
  end
end
