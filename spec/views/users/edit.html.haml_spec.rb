require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :role => "MyString",
      :graduation => "MyString",
      :level => "MyString",
      :avatar => "MyString",
      :phone => "MyString",
      :social_security_number => "",
      :tax_number => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[graduation]"

      assert_select "input[name=?]", "user[level]"

      assert_select "input[name=?]", "user[avatar]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "input[name=?]", "user[social_security_number]"

      assert_select "input[name=?]", "user[tax_number]"
    end
  end
end
