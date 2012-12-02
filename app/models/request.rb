class Request < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :tournament
end
