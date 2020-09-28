require 'rails_helper'

RSpec.describe "withdraws/index", type: :view do
  before(:each) do
    assign(:withdraws, [
      Withdraw.create!(
        :amount => 2.5,
        :user => nil,
        :status => "Status"
      ),
      Withdraw.create!(
        :amount => 2.5,
        :user => nil,
        :status => "Status"
      )
    ])
  end

  it "renders a list of withdraws" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
