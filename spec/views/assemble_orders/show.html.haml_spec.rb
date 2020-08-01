require 'rails_helper'

RSpec.describe "assemble_orders/show", type: :view do
  before(:each) do
    @assemble_order = assign(:assemble_order, AssembleOrder.create!(
      :last_assembler => 2,
      :next_assembler => 3,
      :assembler_list => "Assembler List"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Assembler List/)
  end
end
