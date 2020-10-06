require 'rails_helper'

RSpec.describe "activation_requests/show", type: :view do
  before(:each) do
    @activation_request = assign(:activation_request, ActivationRequest.create!(
      :user => nil,
      :requested_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
