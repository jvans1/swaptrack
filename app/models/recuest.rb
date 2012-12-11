class Recuest < ActiveRecord::Base
  ##need to remove :active from mass assignment
  attr_accessible :receiver, :type, :status, :active, :tournament
  validates_presence_of :user, :receiver, :on => :create

  belongs_to :user
  belongs_to :tournament
  belongs_to :receiver, :class_name=> "User", :foreign_key => "receiver_id"
  
  STATUS_CODES = {:accepted => 1, :denied => -1, :edited =>2, :pending=>0}

  def init
    self.status = 0
  end

  def accepted 
    self.status = STATUS_CODES.fetch(:accepted)
  end

  def denied
    self.status = STATUS_CODES.fetch(:denied)
  end
  
  def edited
    self.status = STATUS_CODES.fetch(:edited)
  end

  def status_name
    STATUS_CODES.key(self.status).to_s
  end

  def updateable?   
    true if receiver.inbound_requests.include?(self)
  end

end


