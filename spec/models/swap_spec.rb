require 'spec_helper'

describe Swap do
  before :each do
    @u = FactoryGirl.create(:user)
    @u1 = FactoryGirl.create(:user)
    @p = FactoryGirl.create(:prize)
    @p1 = FactoryGirl.create(:prize)
    @s1 = FactoryGirl.create(:swap,:user=>@u1)
    @s2 = FactoryGirl.create(:swap, :user=>@u)
    @s = FactoryGirl.create(:swap, :user=>@u, :receiver=> @u1, :receiver_prize=>@p1, :user_prize=>@p)

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


  it "returns a hash with with 2 users and a value" do 
    @s.result.class.must.equal Hash
  end

  it "returns a winner and loser if one person receivs a prize" do
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
    it "a value when one number is zero" do
      @p.amount = 0 
      @s.result[:value].should_not be nil
    end
    it "0 when both values are 0 " do
      @p.amount = 0
      @p1.amount = 0
      @s.result[:value].should eq 0
    end
  end
end
