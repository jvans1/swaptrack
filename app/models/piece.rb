class Piece < Recuest
  attr_accessible :percent, :amount, :active, :user_prize

  belongs_to :tournament
  has_one :user_prize, :class_name=> "Prize", :foreign_key => "swap_id"
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
    self.user_prize.amount * self.percent/100.0
  end

end
