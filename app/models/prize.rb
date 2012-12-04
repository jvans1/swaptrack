class Prize < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :tournament
  belongs_to :user
end
