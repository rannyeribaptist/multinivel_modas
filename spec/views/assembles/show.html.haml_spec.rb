require 'rails_helper'

RSpec.describe "assembles/show", type: :view do
  before(:each) do
    @assemble = assign(:assemble, Assemble.create!(
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
