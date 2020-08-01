require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :xml_file => "Xml File"
      ),
      Order.create!(
        :xml_file => "Xml File"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Xml File".to_s, :count => 2
  end
end
