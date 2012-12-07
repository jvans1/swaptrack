require 'spec_helper'

describe "pieces/index" do
  before(:each) do
    assign(:pieces, [
      stub_model(Piece),
      stub_model(Piece)
    ])
  end

  it "renders a list of pieces" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
