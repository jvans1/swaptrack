require 'spec_helper'
require 'factory_girl_rails'


describe User do
  before :all do
    @u1 = User.create
    @u2 = User.create
    @t = Tournament.create
    @r = Request.create
    @r.tournament = @t
    @r.user = @u1
    @r.requester = @u2
    @r.save  
  end
  after :all do
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
      @u2.inbound_requests.last.should eq(@r)
    end
    it "can deny a request" do 
      @u2.deny_request
      @u2.inbound_requests.should eq([])
    end
  end
end
