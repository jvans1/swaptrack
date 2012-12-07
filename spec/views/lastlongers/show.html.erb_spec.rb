require 'spec_helper'

describe "lastlongers/show" do
  before(:each) do
    @lastlonger = assign(:lastlonger, stub_model(Lastlonger))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
