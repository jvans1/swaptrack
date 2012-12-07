require 'spec_helper'

describe "pieces/new" do
  before(:each) do
    assign(:piece, stub_model(Piece).as_new_record)
  end

  it "renders new piece form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pieces_path, :method => "post" do
    end
  end
end
