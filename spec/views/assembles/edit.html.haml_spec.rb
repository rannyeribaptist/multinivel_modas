require 'rails_helper'

RSpec.describe "assembles/edit", type: :view do
  before(:each) do
    @assemble = assign(:assemble, Assemble.create!(
      :purchase => nil,
      :user => nil,
      :status => "MyString"
    ))
  end

  it "renders the edit assemble form" do
    render

    assert_select "form[action=?][method=?]", assemble_path(@assemble), "post" do

      assert_select "input[name=?]", "assemble[purchase_id]"

      assert_select "input[name=?]", "assemble[user_id]"

      assert_select "input[name=?]", "assemble[status]"
    end
  end
end
