require 'rails_helper'

RSpec.describe "starter_packs/show", type: :view do
  before(:each) do
    @starter_pack = assign(:starter_pack, StarterPack.create!(
      :product => nil,
      :user_starter_pack => nil,
      :price => "Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Price/)
  end
end
