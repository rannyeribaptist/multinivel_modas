require 'rails_helper'

RSpec.describe "assemble_orders/edit", type: :view do
  before(:each) do
    @assemble_order = assign(:assemble_order, AssembleOrder.create!(
      :last_assembler => 1,
      :next_assembler => 1,
      :assembler_list => "MyString"
    ))
  end

  it "renders the edit assemble_order form" do
    render

    assert_select "form[action=?][method=?]", assemble_order_path(@assemble_order), "post" do

      assert_select "input[name=?]", "assemble_order[last_assembler]"

      assert_select "input[name=?]", "assemble_order[next_assembler]"

      assert_select "input[name=?]", "assemble_order[assembler_list]"
    end
  end
end
