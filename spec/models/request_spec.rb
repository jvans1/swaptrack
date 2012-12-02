require 'spec_helper'


describe Request do
  before :each do
    @r = Request.new
  end
  after :each do

    Request.all.each{|r| r.destroy}
  end

  it "defaults to 0 status code" do
    @r.status.should eq(0)
  end

  it "can be in an edited status" do 
    @r.edit
    @r.status.should eq(2)
  end

  it "can be accepted" do 
    @r.accepted
    @r.status.should eq(1)
  end

  it "can be denied" do 
    @r.denied
    @r.status.should eq(-1)
  end

end