require 'rails_helper'

RSpec.describe "assemble_orders/new", type: :view do
  before(:each) do
    assign(:assemble_order, AssembleOrder.new(
      :last_assembler => 1,
      :next_assembler => 1,
      :assembler_list => "MyString"
    ))
  end

  it "renders new assemble_order form" do
    render

    assert_select "form[action=?][method=?]", assemble_orders_path, "post" do

      assert_select "input[name=?]", "assemble_order[last_assembler]"

      assert_select "input[name=?]", "assemble_order[next_assembler]"

      assert_select "input[name=?]", "assemble_order[assembler_list]"
    end
  end
end
