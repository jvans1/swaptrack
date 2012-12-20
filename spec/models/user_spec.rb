require 'spec_helper'


describe User do
  before(:each) do 
    @u = FactoryGirl.create(:user)
    @u1 = FactoryGirl.create(:user)
    @r = FactoryGirl.create(:piece, :user=> @u, :receiver=> @u1,:user_prize=>Prize.new(:amount=>0), :percent=>5, :markup=>1)
    @s = FactoryGirl.create(:swap, :user=>@u,:receiver=>@u1,:user_prize=>Prize.new(:amount=>0),:receiver_prize=>Prize.new(:amount=>0))
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

      describe "returns total user owes" do 
        it "should be the result of percent and amount for only 1 prize" do 
          
          p = FactoryGirl.create(:prize, :amount=> 10000)
          rec2 = FactoryGirl.build(:piece, :user=> @u, :receiver=>@u1,:user_prize=>Prize.new(:amount=>0), :percent=>5, :markup=>1)
          p2 = FactoryGirl.create(:prize, :amount => 0 )
          rec2.user_prize = p2
          @r.percent = 5 
          @r.user_prize = p

          @u1.total_debt.should eq 500
        end
        it "should be the percent times the buy in if there is no prize" do
          
          p = FactoryGirl.build(:prize, :amount=> 0)
          @r.percent = 5
          @r.user_prize = p 
          @u1.total_debt.should eq 0 
        end

      end
      it "returns total owed" do 
          p = FactoryGirl.build(:prize, :amount=> 10000)
          rec2 = FactoryGirl.build(:piece, :user=> @u, :receiver=>@u1,:user_prize=>Prize.new(:amount=>0), :percent=>5, :markup=>1)
          p2 = FactoryGirl.build(:prize, :amount => 10000)
          rec2.user_prize = p2
          
          @r.percent = 5 
          @r.user_prize = p
          @u.total_owed.should eq 1000
      end


    end
  end

  it "returns an array of pending requests, outbound as default" do 
    @r.status = 0 
    @s.status = 0 
    
    @u.pending_recuests.count.should eq 2
  end
  describe "sends a request" do
    it "and populates requests with object" do 
      @r = FactoryGirl.build(:piece, :receiver =>@u1,:user_prize=>Prize.new(:amount=>0), :percent=>5, :markup=>1)
      @u.send_request(@r)
      @u.save 
      @u.recuests.should include(@r)
    end
    it "and adds recuest to inbound recuest of receiver" do
      @r = FactoryGirl.build(:piece, :receiver =>@u1,:user_prize=>Prize.new(:amount=>0), :percent=>5, :markup=>1)
      @u.send_request(@r)
      @u1.inbound_requests.should include(@r) 
    end
  end


end
