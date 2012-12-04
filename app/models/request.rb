class Request < ActiveRecord::Base
  attr_accessible :piece_size, :tournament, :receiver
  belongs_to :user
  belongs_to :tournament
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
  after_initialize :init 
  STATUS_CODES = {:accepted => 1, :denied => -1, :edited =>2, :pending=>0}

  def init
  end

  def accepted 
    self.status = STATUS_CODES[:accepted]
  end

  def denied
    self.status = STATUS_CODES[:denied]
  end
  
  def edit
    self.status = STATUS_CODES[:edited]
  end

  def status_name
    STATUS_CODES.key(self.status).to_s
  end


end
