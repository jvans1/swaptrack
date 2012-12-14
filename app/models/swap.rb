class Swap < Recuest
  attr_accessible :percent, :amount, :tournament,:user_prize, :receiver_prize 
  belongs_to :tournament
  belongs_to :user
  has_one :receiver_prize, :class_name => "Prize", :foreign_key => "receiver_prize_id"
  has_one :user_prize, :class_name=> "Prize", :foreign_key => "swap_id"

  def person_owed
    if user_prize.amount > receiver_prize.amount
      user
    elsif user_prize.amount < receiver_prize.amount
      receiver
    else
      nil
    end
  end

  def value
    if person_owed == user 
      percent/100.0 * user_prize.amount  
    elsif person_owed == receiver
      percent/100.0 * receiver_prize.amount
    else
      user_prize.amount - receiver_prize.amount 
    end
  end
  def result
    
    
  end
end