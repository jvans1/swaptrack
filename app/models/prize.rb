class Prize < ActiveRecord::Base
  attr_accessible :place, :user, :amount, :tournament, :recuest
  belongs_to :user_prize, :class_name => "Swap", :foreign_key=>"swap_id"
  belongs_to :recuest_receiver_prize, :class_name =>"Swap",  :foreign_key=>"receiver_prize_id"
  belongs_to :tournament
  belongs_to :user 
end

