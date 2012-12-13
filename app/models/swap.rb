class Swap < Recuest
  attr_accessible :percent, :amount, :tournament

  belongs_to :tournament
end