class Piece < Recuest
  attr_accessible :percent, :amount, :active

  belongs_to :tournament
  def user_who_owes
    if active
      self.receiver
    elsif (self.prize.amount * self.percent) > (self.percent * self.tournament.buy_in)
      self.user 
    else
      self.receiver
    end
  end
end
