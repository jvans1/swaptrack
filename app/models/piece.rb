class Piece < Recuest
  attr_accessible :percent, :amount

  belongs_to :tournament
end
