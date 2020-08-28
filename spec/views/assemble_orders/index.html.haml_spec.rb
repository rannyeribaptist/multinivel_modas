require 'rails_helper'

RSpec.describe "assemble_orders/index", type: :view do
  before(:each) do
    assign(:assemble_orders, [
      AssembleOrder.create!(
        :purchase => nil,
        :user => nil,
        :status => "Status"
      ),
      AssembleOrder.create!(
        :purchase => nil,
        :user => nil,
        :status => "Status"
      )
    ])
  end

  it "renders a list of assemble_orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
