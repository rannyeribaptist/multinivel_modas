require 'rails_helper'

RSpec.describe "assemble_orders/edit", type: :view do
  before(:each) do
    @assemble_order = assign(:assemble_order, AssembleOrder.create!(
      :purchase => nil,
      :user => nil,
      :status => "MyString"
    ))
  end

  it "renders the edit assemble_order form" do
    render

    assert_select "form[action=?][method=?]", assemble_order_path(@assemble_order), "post" do

      assert_select "input[name=?]", "assemble_order[purchase_id]"

      assert_select "input[name=?]", "assemble_order[user_id]"

      assert_select "input[name=?]", "assemble_order[status]"
    end
  end
end
