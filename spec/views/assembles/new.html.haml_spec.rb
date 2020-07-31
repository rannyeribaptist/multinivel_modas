require 'rails_helper'

RSpec.describe "assembles/new", type: :view do
  before(:each) do
    assign(:assemble, Assemble.new(
      :purchase => nil,
      :user => nil,
      :status => "MyString"
    ))
  end

  it "renders new assemble form" do
    render

    assert_select "form[action=?][method=?]", assembles_path, "post" do

      assert_select "input[name=?]", "assemble[purchase_id]"

      assert_select "input[name=?]", "assemble[user_id]"

      assert_select "input[name=?]", "assemble[status]"
    end
  end
end
