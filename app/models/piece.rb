class Piece < Recuest
  attr_accessible :percent, :active, :user_prize

  belongs_to :tournament
  has_one :user_prize, :class_name=> "Prize", :foreign_key => "swap_id"
  def user_who_owes
    if active
      self.receiver
    elsif value > cost
      self.user 
    else
      self.receiver
    end
  end

  def cost
    self.percent/100.0 * self.tournament.buy_in
  end

  def value
    if active
      cost 
    else
      user_prize ? user_prize.amount * self.percent/100.0 : 0 
    end
  end

  def result
    user_whose_owed =  user_who_owes == user ? receiver : user 
    {:user_who_owes => user_who_owes, :user_whose_owed => user_whose_owed, :value=> value }
  end

end
