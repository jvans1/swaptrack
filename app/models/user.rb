class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :recuests
  has_many :inbound_requests, :class_name=> "Recuest", :foreign_key=> "receiver_id"
  has_many :prizes
  #belongs_to :manager

  def approve(recuest)
    recuest.accepted if authorized_to_update_request?(recuest)
  end
  def deny(recuest)
    recuest.denied if authorized_to_update_request?(recuest)
  end

  def total_prizes
     self.prizes.all.select{|p| p.user_id == 1}.map { |p| p.amount }.sum
  end
  def send_request(recuest)
    self.recuests << recuest
    recuest.receiver.inbound_requests << recuest
  end

  def swaps
    total = self.all_recuests.select{ |t| t.type == "Swap" && t.status_name =="accepted"}
  end

  def pieces
    recuests.select{ |t| t.type == "Piece" && t.status_name =="accepted"}
  end
  
  def lastlongers
    total = self.all_recuests.select{ |t| t.type == "Lastlonger" && t.status_name =="accepted"}
  end

  def pending_recuests
    recuests.map { |r| r.status == 0 }.count
  end

  def balance_with(person)
    all_recuests.select{ |r| r.status ==1 &&(r.receiver == person || r.user == person)}.map{ |r| r.prize.amount}.sum
  end


  def all_recuests
    inbound_requests + recuests
  end

  def total_debt
    ##go through all the recuests
    ##find recuests where user owes money and add them up
      ##Owe money when prize belongs to me and is positive
      ##Owe money when the prize doesn't belong to me and is negative
      ##Owe money when I take a piece and there is no prize
      ##Owe money when I lose a last longer
    my_prizes = self.all_recuests.select{ |r| r.prize.user == self && r.prize.amount >0 if r.prize}.map{ |p| p.amount }.sum
    not_my_prizes = self.all_recuests.select{ |r| r.prize.user != self &&r.prize.amount <0 if r.prize}.map{ |p| p.amount }.sum
    no_prize_pieces = self.inbound_requests.select { |r| r.type == "Piece" }.map { |p| p.amount }.sum 
    my_prizes + not_my_prizes + no_prize_pieces
  end

  def total_owed
    my_prizes = self.all_recuests.select{ |r| r.prize.user == self && r.prize.amount < 0 if r.prize}.map{ |p| p.amount }.sum
    not_my_prizes = self.all_recuests.select{ |r| r.prize.user != self &&r.prize.amount > 0 if r.prize}.map{ |p| p.amount }.sum
    no_prize_pieces = self.recuests.select { |r| r.type == "Piece" }.map { |p| p.amount }.sum 
    my_prizes + not_my_prizes + no_prize_pieces
  end

  private 
  def authorized_to_update_request?(recuest)
    inbound_requests.include?(recuest)
  end
  

end
