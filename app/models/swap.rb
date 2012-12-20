class Swap < Recuest
  attr_accessible :percent, :amount, :tournament,:user_prize, :receiver_prize, :user
  validates_presence_of :percent, :tournament, :user_prize, :receiver_prize
  belongs_to :tournament
  belongs_to :user

  has_one :receiver_prize, :class_name => "Prize", :foreign_key => "receiver_prize_id"
  has_one :user_prize, :class_name=> "Prize", :foreign_key => "swap_id"

  def result

    unless active 
      @u_prize = user_prize ? (user_prize.amount ? user_prize.amount : 0 ) : 0 
      @r_prize = receiver_prize ? (receiver_prize.amount ? receiver_prize.amount : 0 ) : 0
      
      value = (@r_prize.to_f - @u_prize.to_f).abs.to_f * percent/100.0 
      if @r_prize && @u_prize 
        @user_who_owes = @r_prize > @u_prize ? receiver : user
        @user_whose_owed = @r_prize > @u_prize ? user : receiver 
      elsif r_prize != 0
         @user_who_owes = receiver
         @user_whose_owed = user
      elsif @u_prize != 0
        @user_who_owes = user 
        @user_whose_owed = receiver 
      else
        raise "Both @u_prize and r_prize are nil"
      end
      {:user_whose_owed => @user_whose_owed, :user_who_owes => @user_who_owes, :value => value}
    else
    {:user_whose_owed => @user_whose_owed, :user_who_owes => @user_who_owes, :value => 0}
    end
  end

  def tournaments=()

    
  end
  def tournaments
  end

end