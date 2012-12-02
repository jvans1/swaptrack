class Request < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :tournament
  belongs_to :requester, :class_name => "User", :foreign_key => "requester_id"
  
end
