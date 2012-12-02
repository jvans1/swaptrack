class Request < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :tournament
  belongs_to :requester, :class_name => "User", :foreign_key => "requester_id"
  after_initialize :init 
  STATUS_CODES = {:accepted => 1, :denied => -1, :edited =>2, :pending=>0}

  def init
    self.status = STATUS_CODES[:pending]
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

end
