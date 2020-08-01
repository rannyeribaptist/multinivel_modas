require 'rails_helper'

RSpec.describe "support_tickets/edit", type: :view do
  before(:each) do
    @support_ticket = assign(:support_ticket, SupportTicket.create!(
      :ticket => "MyString",
      :filled_by => "MyString",
      :purchase => nil
    ))
  end

  it "renders the edit support_ticket form" do
    render

    assert_select "form[action=?][method=?]", support_ticket_path(@support_ticket), "post" do

      assert_select "input[name=?]", "support_ticket[ticket]"

      assert_select "input[name=?]", "support_ticket[filled_by]"

      assert_select "input[name=?]", "support_ticket[purchase_id]"
    end
  end
end
