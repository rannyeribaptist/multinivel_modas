require 'rails_helper'

RSpec.describe "starter_packs/new", type: :view do
  before(:each) do
    assign(:starter_pack, StarterPack.new(
      :product => nil,
      :user_starter_pack => nil,
      :price => "MyString"
    ))
  end

  it "renders new starter_pack form" do
    render

    assert_select "form[action=?][method=?]", starter_packs_path, "post" do

      assert_select "input[name=?]", "starter_pack[product_id]"

      assert_select "input[name=?]", "starter_pack[user_starter_pack_id]"

      assert_select "input[name=?]", "starter_pack[price]"
    end
  end
end
