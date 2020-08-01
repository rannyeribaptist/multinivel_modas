require 'rails_helper'

RSpec.describe "assembles/index", type: :view do
  before(:each) do
    assign(:assembles, [
      Assemble.create!(
        :purchase => nil,
        :user => nil,
        :status => "Status"
      ),
      Assemble.create!(
        :purchase => nil,
        :user => nil,
        :status => "Status"
      )
    ])
  end

  it "renders a list of assembles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
