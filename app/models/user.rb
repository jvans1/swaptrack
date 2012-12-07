class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :requests
  has_many :tournaments, :through=> :requests
  has_many :inbound_requests, :class_name=>"Request", :foreign_key=> "receiver_id"
  has_many :prizes
  has_many :pieces
  has_many :inbound_pieces, :class_name=>"Piece", :foreign_key=> "piece_receiver_id"
  


  def approve(request)
    request.accepted if authorized_to_update_request?(request)
  end
  def deny(request)
    request.denied if authorized_to_update_request?(request)
  end

  def total_prizes
     self.prizes.all.select{|p| p.user_id == 1}.map { |p| p.amount }.sum
  end
  def send_request(request)
    self.requests << request  
    request.receiver.inbound_requests << request
  end

  private 
  def authorized_to_update_request?(request)
    inbound_requests.include?(request)
  end

end
