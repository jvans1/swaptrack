class User < ActiveRecord::Base
  attr_accessible :name
  has_many :requests, :dependent => :destroy 
  has_many :tournaments, :through=> :requests
  has_many :inbound_requests, :class_name=>"Request", :foreign_key=> "requester_id"


end
