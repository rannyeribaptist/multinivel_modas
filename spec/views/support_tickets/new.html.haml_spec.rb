require 'rails_helper'

RSpec.describe "support_tickets/new", type: :view do
  before(:each) do
    assign(:support_ticket, SupportTicket.new(
      :ticket => "MyString",
      :filled_by => "MyString",
      :purchase => nil
    ))
  end

  it "renders new support_ticket form" do
    render

    assert_select "form[action=?][method=?]", support_tickets_path, "post" do

      assert_select "input[name=?]", "support_ticket[ticket]"

      assert_select "input[name=?]", "support_ticket[filled_by]"

      assert_select "input[name=?]", "support_ticket[purchase_id]"
    end
  end
end
