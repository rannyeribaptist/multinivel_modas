require 'rails_helper'

RSpec.describe "activation_requests/index", type: :view do
  before(:each) do
    assign(:activation_requests, [
      ActivationRequest.create!(
        :user => nil,
        :requested_id => ""
      ),
      ActivationRequest.create!(
        :user => nil,
        :requested_id => ""
      )
    ])
  end

  it "renders a list of activation_requests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
