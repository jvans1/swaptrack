require 'spec_helper'

describe Tournament do
  before :each do
    @t = create(:tournament)
  end
  it "has a buy in" do
    @t.buy_in = 2500
    @t.buy_in.should eq(2500)
  end
  it "can have multiple users" do
    u1 = create(:user)
    u2 = create(:user)
    @t.users << u1
    @t.users << u2
    @t.users.count.should eq(2)
  end
  describe "#tournaments" do 
    it "returns an array of all tournaments in hash" do
      Tournament.tournaments.first.should be_a_kind_of Hash 
    end
    it "should have a className equal to id" do 
      Tournament.tournaments.first[:className].should eq Tournament.first.id
    end
    it "should have a "
  end

end
