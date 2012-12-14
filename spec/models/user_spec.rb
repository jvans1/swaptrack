require 'spec_helper'


describe User do
  before(:each) do 
    @u = FactoryGirl.create(:user)
    @u1 = FactoryGirl.create(:user)
    @r = FactoryGirl.create(:recuest, :user=> @u, :receiver=> @u1, :type=>"Piece")
    @s = FactoryGirl.create(:swap, :user=>@u,:receiver=>@u1)
  end
  describe "properties" do
    describe User do 
      it "cannot accept a sent request" do
        @r.should_not_receive(:accepted)
        @u.approve(@r)
      end

      it "can accept an inbound request" do
        @r.should_receive(:accepted)
        @u1.approve(@r)
      end
      it "cannot deny a sent request" do
        @r.should_not_receive(:denied)
        @u.deny(@r) 
      end

      it "can deny an inbound request" do
        @r.should_receive(:denied)
        @u1.deny(@r)
      end
      it "can't have duplicate swaps" do
        ##Playing with this in irb makes it look like it doesn't work##
        count = @u1.inbound_requests.count 
        @u1.inbound_requests << @r 
        @u1.inbound_requests.count.should eq count 
      end

      # it "returns an array of swaps" do 

      #   ##This works need to monkey patch == array class for special circumstance##
      #   @u.recuest_collection("Piece").should eq [@r]
      # end

      # it "returns an array of inbound and outbound recuests" do

      #   ##MOnkey patch??
      #   p = FactoryGirl.create(:piece, :user=>@u1, :receiver=> @u)
      #   @u.all_recuests.should include([p, @r, @s])
      # end



      # it "returns only accepted swaps" do
      #   s = FactoryGirl.create(:swap)
      #   s1 = FactoryGirl.create(:swap)
      #   u = s.receiver
      #   s1.receiver = u 
      #   s1.status = 1
      #   debugger
      #   u.accepted_swaps.count.should eq 1
      # end
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
