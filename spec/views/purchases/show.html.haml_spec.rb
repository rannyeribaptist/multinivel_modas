require 'rails_helper'

RSpec.describe "purchases/show", type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
      :user => nil,
      :payment_method => "Payment Method",
      :value => "Value",
      :address => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Payment Method/)
    expect(rendered).to match(/Value/)
    expect(rendered).to match(//)
  end
end
