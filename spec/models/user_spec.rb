require 'spec_helper'


describe User do
  before :each do
    @u1 = User.create
    @u2 = User.create
    @t = Tournament.create
    @r = Request.create
    @u1.requests << @r
    @u2.inbound_requests << @r
    @r.tournament = @t
    @r.user = @u1
    @r.requester = @u2
    @r.save  
  end
  after :each do
    User.all.each do |user|
      user.destroy
    end
    Tournament.all.each do |t|
      t.destroy
    end
    Request.all.each do |r|
      r.destroy
    end
  end
  describe "User" do 
    it "can make a request" do
      @u1.requests.first.tournament.should eq(@t)
    end

    it "can receive a request" do
      @u2.inbound_requests.include?(@r).should eq(true)
    end

    it "can approve a request" do 
      @u2.approve(@r)
      @u2.inbound_requests.last.status.should eq(1)
    end
    it "can deny a request" do 
      @u2.deny(@r)
      @u2.inbound_requests.last.status.should eq(-1)
    end

    it "cannot modify a sent request" do 
      @u1.approve(@r)
      @r.status.should eq(0)
      @u1.deny(@r)
      @r.status.should eq(0)
    end
    
    
  end
end
