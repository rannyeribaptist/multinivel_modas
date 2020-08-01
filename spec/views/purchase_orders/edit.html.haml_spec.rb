require 'rails_helper'

RSpec.describe "purchase_orders/edit", type: :view do
  before(:each) do
    @purchase_order = assign(:purchase_order, PurchaseOrder.create!(
      :product => nil,
      :quantity => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit purchase_order form" do
    render

    assert_select "form[action=?][method=?]", purchase_order_path(@purchase_order), "post" do

      assert_select "input[name=?]", "purchase_order[product_id]"

      assert_select "input[name=?]", "purchase_order[quantity]"

      assert_select "input[name=?]", "purchase_order[status]"
    end
  end
end
