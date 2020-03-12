require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :user => nil,
        :name => "Name",
        :description => "Description",
        :price => "Price",
        :hidden => false,
        :quantity => "Quantity"
      ),
      Product.create!(
        :user => nil,
        :name => "Name",
        :description => "Description",
        :price => "Price",
        :hidden => false,
        :quantity => "Quantity"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Quantity".to_s, :count => 2
  end
end
