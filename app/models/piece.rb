class Piece < Recuest
  attr_accessible :percent, :amount, :active

  belongs_to :tournament
  def user_who_owes
    if active
      self.receiver
    elsif value > debt
      self.user 
    else
      self.receiver
    end
  end

  def debt
    self.percent/100.0 * self.tournament.buy_in
  end

  def value
    self.prize.amount * self.percent/100.0
  end

end
