require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }

  it "should have at least one size, picture and category" do
    product = Product.new(name: "teste", description: "teste", price: "teste")
    product.user = User.new

    product.product_sizes.new(size: "teste")
    expect(product).not_to be_valid

    product.product_pictures.new(picture: "teste")
    expect(product).not_to be_valid

    product.product_categories.new(name: "teste")
    expect(product).to be_valid
  end
end
