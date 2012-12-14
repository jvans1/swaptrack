require 'spec_helper'

describe Piece do
  before(:each) do
    @u = FactoryGirl.create(:user)
    @u1 = FactoryGirl.create(:user)
    @p = FactoryGirl.create(:piece, :percent => 5, :user=>@u, :receiver=>@u1)
    @prize = FactoryGirl.create(:prize)
  end

  it "can be in an edited status" do 
    @p.edited
    @p.status.should eq(2)
  end

  it "can be accepted" do 
    @p.accepted
    @p.status.should eq(1)
  end

  it "can be denied" do 
    @p.denied
    @p.status.should eq(-1)
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
      @prize.amount = 0
      @p.prize = @prize 
      @p.user_who_owes.should eq @u1
    end

    it "is the user when the prize is greater than the buy in" do 
      @prize.amount = 10001
      @p.prize = @prize
      @p.user_who_owes.should eq @u
    end
    it "is the receiver when the prize is less than the buy in" do 
      @prize.amount = 9999
      @p.prize = @prize
      @p.user_who_owes.should eq @u1
    end

    it "returns the cost" do 
      @p.debt.should eq 500
    end
    it "returns the value of the piece" do
      @prize.amount = 100000
      @p.prize = @prize 
      @p.value.should eq 5000
    end
  end  
end
