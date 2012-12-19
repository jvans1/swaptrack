class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password
  validates_presence_of :email
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_many :recuests
  has_many :inbound_requests, :class_name=> "Recuest", :foreign_key=> "receiver_id"
  has_many :prizes
  has_many :tournaments, :through => "recuests"
  #belongs_to :manager

  def approve(recuest)
    recuest.accepted if authorized_to_update_request?(recuest)
  end

  def deny(recuest)
    recuest.denied if authorized_to_update_request?(recuest)
  end

  def send_request(recuest)
    self.recuests << recuest
    recuest.user = self 
    recuest.receiver.inbound_requests << recuest
  end

##Prizes##
  def total_prizes
     self.prizes.all.select{|p| p.user_id == 1}.map { |p| p.amount }.sum
  end
####

##Manager
  def recuest_collection(options= {} )
    all_recuests.select{ |t| t.type == options[:type] && t.status == options[:status] if options[:status]}
  end

  def balance_with(person)
    all_recuests.select{ |r| r.status ==1 &&(r.receiver == person || r.user == person)}.map{ |r| r.prize.amount}.sum
  end


  def total_debt
    self.all_recuests.select{ |r| r.result.fetch(:user_who_owes) == self}.map{ |p| p.result.fetch(:value) }.sum
  end


  def total_owed
    not_my_prizes = self.all_recuests.select{ |r| r.result.fetch(:user_whose_owed) == self}.map{ |p| p.result.fetch(:value) }.sum
  end


  def all_recuests
    inbound_requests + recuests
  end

  def pending_recuests
    recuests.select{ |r| r.status == 0 || r.status == nil} 
  end
###
  private 
  def authorized_to_update_request?(recuest)
    inbound_requests.include?(recuest)
  end
 

end
