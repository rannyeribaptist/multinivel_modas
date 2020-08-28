require 'rails_helper'

RSpec.describe "assemble_orders/new", type: :view do
  before(:each) do
    assign(:assemble_order, AssembleOrder.new(
      :purchase => nil,
      :user => nil,
      :status => "MyString"
    ))
  end

  it "renders new assemble_order form" do
    render

    assert_select "form[action=?][method=?]", assemble_orders_path, "post" do

      assert_select "input[name=?]", "assemble_order[purchase_id]"

      assert_select "input[name=?]", "assemble_order[user_id]"

      assert_select "input[name=?]", "assemble_order[status]"
    end
  end
end
