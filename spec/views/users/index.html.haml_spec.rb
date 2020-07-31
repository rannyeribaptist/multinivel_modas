require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :role => "Role",
        :graduation => "Graduation",
        :level => "Level",
        :avatar => "Avatar",
        :phone => "Phone",
        :social_security_number => "",
        :tax_number => "Tax Number"
      ),
      User.create!(
        :name => "Name",
        :role => "Role",
        :graduation => "Graduation",
        :level => "Level",
        :avatar => "Avatar",
        :phone => "Phone",
        :social_security_number => "",
        :tax_number => "Tax Number"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Graduation".to_s, :count => 2
    assert_select "tr>td", :text => "Level".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Tax Number".to_s, :count => 2
  end
end
