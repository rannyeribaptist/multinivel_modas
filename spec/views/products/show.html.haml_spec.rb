require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :user => nil,
      :name => "Name",
      :description => "Description",
      :price => "Price",
      :hidden => false,
      :quantity => "Quantity"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Quantity/)
  end
end
