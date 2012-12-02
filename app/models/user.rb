class User < ActiveRecord::Base
  attr_accessible :name
  has_many :requests, :dependent => :destroy 
  has_many :tournaments, :through=> :requests
  has_many :inbound_requests, :class_name=>"Request", :foreign_key=> "requester_id"

  def approve(request)
    request.accepted if authorized_to_update_request?(request)
  end
  def deny(request)
    request.denied if authorized_to_update_request?(request)
  end

  def authorized_to_update_request?(request)
    inbound_requests.include?(request)
  end
end
