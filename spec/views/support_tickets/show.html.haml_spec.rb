require 'rails_helper'

RSpec.describe "support_tickets/show", type: :view do
  before(:each) do
    @support_ticket = assign(:support_ticket, SupportTicket.create!(
      :ticket => "Ticket",
      :filled_by => "Filled By",
      :purchase => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ticket/)
    expect(rendered).to match(/Filled By/)
    expect(rendered).to match(//)
  end
end
