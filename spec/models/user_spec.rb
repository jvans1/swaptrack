require 'spec_helper'


describe User do
  describe "properties" do
    before :each do
      @u1 = stub_model(User)
      @u2 = stub_model(User)
      @t = stub_model(Tournament)
      @r = stub_model(Request)
      @u1.requests << @r
      @u2.inbound_requests << @r
      @r.tournament = @t
      @r.user = @u1
      @r.requester = @u2
      @r.save  
    end
    describe User do 
      it "can make a request" do
        @u1.requests.first.tournament.should eq(@t)
      end

#       it "can receive a request" do
#         @u2.inbound_requests.include?(@r).should eq(true)
#       end

#       it "cannot modify a sent request" do 
#         @u1.approve(@r)
#         @r.status.should eq(0)
#         @u1.deny(@r)
#         @r.status.should eq(0)
#       end
#     end
#     describe "requests" do
#       before :each do
#         @u1 = User.create
#         @r1 = Request.create 
#         @t1 = Tournament.create
#         @r1.tournament = @t1
#         @r1.piece_size = 10
#       end

#       after :each do
#         User.all.each{ |u| u.destroy}
#         Request.all.each{ |r| r.destroy}
#       end

#       it "can be sent from a user" do
#         @u1.send_request(:user=>@u2, :tournament=>@t, :piece => 10)
#         r = @u1.requests.last 
#         @u2.inbound_requests.include?(r).should eq(true)
#       end

#       it "can approve a request" do 
#         @u1.send_request(:user=>@u2, :tournament=>@t, :piece => 10)
#         @u2.inbound_requests.last.accepted
#         @u2.inbound_requests.last.status == 1
#         @u1.requests.last.status ==1
#       end

#       it "can deny a request" do 
#         @u1.send_request(:user=>@u2, :tournament=>@t, :piece => 10)
#         @u2.inbound_requests.first.denied
#         @u2.inbound_requests.first.status == -1
#         @u1.requests.last.status == -1
#       end
    end
  end
end
