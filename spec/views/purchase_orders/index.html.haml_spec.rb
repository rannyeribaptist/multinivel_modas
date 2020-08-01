require 'rails_helper'

RSpec.describe "purchase_orders/index", type: :view do
  before(:each) do
    assign(:purchase_orders, [
      PurchaseOrder.create!(
        :product => nil,
        :quantity => 2,
        :status => "Status"
      ),
      PurchaseOrder.create!(
        :product => nil,
        :quantity => 2,
        :status => "Status"
      )
    ])
  end

  it "renders a list of purchase_orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
