require 'rails_helper'

RSpec.describe "assemble_orders/show", type: :view do
  before(:each) do
    @assemble_order = assign(:assemble_order, AssembleOrder.create!(
      :purchase => nil,
      :user => nil,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
  end
end
