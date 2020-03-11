require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :role => "Role",
      :graduation => "Graduation",
      :level => "Level",
      :avatar => "Avatar",
      :phone => "Phone",
      :social_security_number => "",
      :tax_number => "Tax Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Graduation/)
    expect(rendered).to match(/Level/)
    expect(rendered).to match(/Avatar/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Tax Number/)
  end
end
