require 'rails_helper'

RSpec.describe "support_tickets/index", type: :view do
  before(:each) do
    assign(:support_tickets, [
      SupportTicket.create!(
        :ticket => "Ticket",
        :filled_by => "Filled By",
        :purchase => nil
      ),
      SupportTicket.create!(
        :ticket => "Ticket",
        :filled_by => "Filled By",
        :purchase => nil
      )
    ])
  end

  it "renders a list of support_tickets" do
    render
    assert_select "tr>td", :text => "Ticket".to_s, :count => 2
    assert_select "tr>td", :text => "Filled By".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
