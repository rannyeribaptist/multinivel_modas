require 'rails_helper'

RSpec.describe "activation_requests/new", type: :view do
  before(:each) do
    assign(:activation_request, ActivationRequest.new(
      :user => nil,
      :requested_id => ""
    ))
  end

  it "renders new activation_request form" do
    render

    assert_select "form[action=?][method=?]", activation_requests_path, "post" do

      assert_select "input[name=?]", "activation_request[user_id]"

      assert_select "input[name=?]", "activation_request[requested_id]"
    end
  end
end
