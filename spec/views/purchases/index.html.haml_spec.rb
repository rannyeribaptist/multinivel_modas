require 'rails_helper'

RSpec.describe "purchases/index", type: :view do
  before(:each) do
    assign(:purchases, [
      Purchase.create!(
        :user => nil,
        :payment_method => "Payment Method",
        :value => "Value",
        :address => nil
      ),
      Purchase.create!(
        :user => nil,
        :payment_method => "Payment Method",
        :value => "Value",
        :address => nil
      )
    ])
  end

  it "renders a list of purchases" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Payment Method".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
