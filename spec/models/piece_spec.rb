require 'spec_helper'

describe Piece do
  before(:each) do
    @u = FactoryGirl.create(:user)
    @u1 = FactoryGirl.create(:user)
    @p = FactoryGirl.create(:piece, :percent => 5, :user=>@u, :receiver=>@u1)
  end

  it "returns the user bought the piece" do 
    @p.receiver.should eq @u1
  end
    describe "the person responsible for payment" do 
    it "is always the receiver when active is true" do 
      @p.active = true
      @p.user_who_owes.should eq @u1
    end

    it "is the receiver when the prize = 0" do 
      @prize = FactoryGirl.create(:prize, :amount=>0)
      @p.prize = @prize 
      @p.user_who_owes.should eq @u1
    end

    it "is the user when the prize is greater than the buy in" do 
      @prize = FactoryGirl.create(:prize, :amount =>10001)
      @p.prize = @prize
      @p.user_who_owes.should eq @u
    end
  end
end
