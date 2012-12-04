require 'spec_helper'

describe Tournament do
  before :each do
    @t = Tournament.create
  end
  after :each do
    Tournament.all.each{|t| t.destroy}
  end
  it "has a buy in" do
    @t.buy_in = 2500
    @t.buy_in.should eq(2500)
  end
  it "can have multiple users" do
    u1 = User.new
    u2 = User.new
    @t.users << u1
    @t.users << u2
    @t.users.count.should eq(2)
  end
end
