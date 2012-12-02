class Tournament < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :requests
  has_many :users, :through=> :requests
end
