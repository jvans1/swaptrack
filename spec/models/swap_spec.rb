require 'spec_helper'

describe Swap do
  before :each do
    @u = create(:user)
    @u1 = create(:user)
    @p = create(:prize)
    @p1 = create(:prize)
    @s1 = create(:swap,:user=>@u1, :receiver=> @u, :receiver_prize=> create(:prize), :user_prize=> create(:prize))
    @s2 = create(:swap, :user=>@u, :receiver=> @u, :receiver_prize=>  create(:prize), :user_prize=> create(:prize))
    @s = create(:swap, :user=>@u, :receiver=> @u1, :receiver_prize=>@p1, :user_prize=>@p)

  end  
  it "can be in an edited status" do 
    @s.edited
    @s.status.should eq(2)
  end

  it "can be accepted" do 
    @s.accepted
    @s.status.should eq(1)
  end

  it "can be denied" do 
    @s.denied
    @s.status.should eq(-1)
  end

  it "returns a winner and loser if one person receives a prize" do
    @s.result.count.must.equal 3
  end
  describe "returns" do 
    before :each do
      @p.amount = 1000
      @p1.amount = 900
      @s.percent = 5
    end
    it "a winner, a loser, and a value" do
      @s.result[:user_who_owes].must.equal @u
      @s.result[:user_whose_owed].must.equal @u1 
    end
    it "computers the value of the swap" do 
      @s.result[:value].should eq 5.0
    end
    it "is always 0 when active is true" do 
      @s.active = true 
      @s.result[:value].should eq 0 
    end
    it "a value when one number is zero" do
      @p.amount = 0 
      @s.result[:value].should_not be nil
    end
    it "0 when both values are 0 " do
      @p.amount = 0
      @p1.amount = 0
      @s.result[:value].should eq 0
    end
    it "0 when both prizes are the same" do 
      @p.amount = 10000
      @p1.amount =  10000 
      @s.result[:value].should eq 0 
    end
    it "is the percent times the difference in prize amounts" do 
      @p.amount = 5000
      @p1.amount = 15000
      @s.result[:value].should eq 500
    end

  end
end
