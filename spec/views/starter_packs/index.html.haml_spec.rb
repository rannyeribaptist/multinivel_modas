require 'rails_helper'

RSpec.describe "starter_packs/index", type: :view do
  before(:each) do
    assign(:starter_packs, [
      StarterPack.create!(
        :product => nil,
        :user_starter_pack => nil,
        :price => "Price"
      ),
      StarterPack.create!(
        :product => nil,
        :user_starter_pack => nil,
        :price => "Price"
      )
    ])
  end

  it "renders a list of starter_packs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
  end
end
