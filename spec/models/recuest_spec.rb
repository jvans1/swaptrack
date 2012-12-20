require 'spec_helper'


describe Recuest do
  before :each do
    @u = FactoryGirl.create(:user)
    @u1 = FactoryGirl.create(:user)
    @r = FactoryGirl.create(:recuest, :user=>@u, :receiver=> @u1,:user_prize=>Prize.new(:amount=>0),:receiver_prize=>Prize.new(:amount=>0))
  end

  it "can be in an edited status" do 
    @r.edited
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
  describe ".receiver=" do
    it "assigns a receiver by id" do 
      @r
    end
  end

end