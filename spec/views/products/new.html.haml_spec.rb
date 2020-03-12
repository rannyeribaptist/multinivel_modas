require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :user => nil,
      :name => "MyString",
      :description => "MyString",
      :price => "MyString",
      :hidden => false,
      :quantity => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[user_id]"

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[hidden]"

      assert_select "input[name=?]", "product[quantity]"
    end
  end
end
