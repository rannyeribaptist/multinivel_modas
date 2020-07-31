require 'rails_helper'

RSpec.describe "purchase_orders/new", type: :view do
  before(:each) do
    assign(:purchase_order, PurchaseOrder.new(
      :product => nil,
      :quantity => 1,
      :status => "MyString"
    ))
  end

  it "renders new purchase_order form" do
    render

    assert_select "form[action=?][method=?]", purchase_orders_path, "post" do

      assert_select "input[name=?]", "purchase_order[product_id]"

      assert_select "input[name=?]", "purchase_order[quantity]"

      assert_select "input[name=?]", "purchase_order[status]"
    end
  end
end
