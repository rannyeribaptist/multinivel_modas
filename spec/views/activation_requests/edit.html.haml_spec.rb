require 'rails_helper'

RSpec.describe "activation_requests/edit", type: :view do
  before(:each) do
    @activation_request = assign(:activation_request, ActivationRequest.create!(
      :user => nil,
      :requested_id => ""
    ))
  end

  it "renders the edit activation_request form" do
    render

    assert_select "form[action=?][method=?]", activation_request_path(@activation_request), "post" do

      assert_select "input[name=?]", "activation_request[user_id]"

      assert_select "input[name=?]", "activation_request[requested_id]"
    end
  end
end
