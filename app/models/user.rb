class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :recuests
  has_many :inbound_requests, :class_name=> "Recuest", :foreign_key=> "receiver_id"
  has_many :prizes

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
    inbound = inbound_requests.select{ |t| t.type == "Swap" && t.status_name =="accepted"}
    outbound = recuests.select{ |t| t.type == "Swap" && t.status_name =="accepted"}
    total = inbound + outbound
  end

  def pieces
    recuests.select{ |t| t.type == "Piece" && t.status_name =="accepted"}
  end
  
  def lastlongers
    inbound = inbound_requests.select{ |t| t.type == "Lastlonger" && t.status_name =="accepted"}
    outbound = recuests.select{ |t| t.type == "Lastlonger" && t.status_name =="accepted"}
    total = inbound + outbound  
  end

  private 
  def authorized_to_update_request?(recuest)
    inbound_requests.include?(recuest)
  end

end
