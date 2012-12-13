class Prize < ActiveRecord::Base
  attr_accessible :place, :user, :amount, :tournament, :recuest
  has_one :recuest
  belongs_to :tournament
  belongs_to :user


end
