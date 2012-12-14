require 'spec_helper'

describe Swap do
  before :each do
    @u = FactoryGirl.create(:user)
    @r = FactoryGirl.create(:user)
    @p1 = FactoryGirl.create(:swap,:user=>@r)
    @p = FactoryGirl.create(:swap, :user=>@u)
    @r = FactoryGirl.create(:swap, :user=>@u, :receiver=> @r)

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


  it "returns a hash with with 2 users and a value" do 
    @r.result.class.must.equal Hash
  end


end
