class Tournament < ActiveRecord::Base
  #to be depricated mass assignment of buy_in/name
  attr_accessible :title, :body, :name, :buy_in
  has_many :requests
  has_many :users, :through=> :requests
  has_many :prizes
end
