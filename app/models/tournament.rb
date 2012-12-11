class Tournament < ActiveRecord::Base
  #to be depricated mass assignment of buy_in/name
  attr_accessible :title, :body, :name, :buy_in
  has_many :calls
  has_many :users, :through=> :calls
  has_many :prizes
  has_many :swaps
  has_many :pieces
end
