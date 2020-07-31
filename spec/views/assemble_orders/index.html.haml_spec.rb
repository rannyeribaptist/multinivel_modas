require 'rails_helper'

RSpec.describe "assemble_orders/index", type: :view do
  before(:each) do
    assign(:assemble_orders, [
      AssembleOrder.create!(
        :last_assembler => 2,
        :next_assembler => 3,
        :assembler_list => "Assembler List"
      ),
      AssembleOrder.create!(
        :last_assembler => 2,
        :next_assembler => 3,
        :assembler_list => "Assembler List"
      )
    ])
  end

  it "renders a list of assemble_orders" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Assembler List".to_s, :count => 2
  end
end
