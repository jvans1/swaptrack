class Recuest < ActiveRecord::Base
  ##need to remove :active, :user_prize user from mass assignment
  attr_accessible :receiver, :type, :status, :active, :tournament, :percent, :prize, :user, :receiver, :user_prize
  validates_presence_of :user, :receiver
  validates_presence_of :user_prize  
  belongs_to :user
  belongs_to :tournament
  belongs_to :receiver, :class_name=> "User", :foreign_key => "receiver_id"
  

  has_one :receiver_prize, :class_name => "Prize", :foreign_key => "receiver_prize_id"
  has_one :user_prize, :class_name=> "Prize", :foreign_key => "swap_id"

  STATUS_CODES = {:accepted => 1, :denied => -1, :edited =>2, :pending=>0}

  def init
    self.status = 0
  end

  def accepted 
    self.status = STATUS_CODES.fetch(:accepted) if updateable?
  end

  def denied
    self.status = STATUS_CODES.fetch(:denied) if updateable?
  end
  
  def edited
    self.status = STATUS_CODES.fetch(:edited)
  end

  def status_name
    STATUS_CODES.key(self.status).to_s
  end

  def updateable?   
    true if receiver && receiver.inbound_requests.include?(self)
  end

  def self.create_recuest(type)
    case type
    when "Swap"
      Swap.new 
    when "Piece"
      Piece.new
    when "Lastlonger" 
      Lastlonger.new
    end
  end
  
  def receivers=(ids )
    ids.each do |id|
      User.find_by_id(id)
    end
  end
  def receivers
    
  end
  
  def tournaments=()

    
  end
  def tournaments
  end
end


