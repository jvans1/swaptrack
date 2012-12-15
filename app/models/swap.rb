class Swap < Recuest
  attr_accessible :percent, :amount, :tournament,:user_prize, :receiver_prize 
  belongs_to :tournament
  belongs_to :user
  has_one :receiver_prize, :class_name => "Prize", :foreign_key => "receiver_prize_id"
  has_one :user_prize, :class_name=> "Prize", :foreign_key => "swap_id"

  def result
    u_prize = (user_prize.amount if user_prize) || 0 
    r_prize = (receiver_prize.amount if receiver_prize) || 0
    value = (r_prize - u_prize).abs * percent/100.0 
    user_who_owes = r_prize > u_prize ? receiver : user
    user_whose_owed = r_prize > u_prize ? user : receiver 
    {:user_whose_owed => user_whose_owed, :user_who_owes => user_who_owes, :value => value}
  end

end