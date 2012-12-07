require 'spec_helper'

describe "pieces/show" do
  before(:each) do
    @piece = assign(:piece, stub_model(Piece))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
