# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recuest do
  status 0
  user { |a| a.association(:user) }
  receiver { |r| r.association(:user )}

  end
end


FactoryGirl.define do
    factory :piece do
    type "Piece" 
    percent 5
    tournament { |t| t.association(:tournament)}
  end
end

FactoryGirl.define do 
  factory :swap do
    type "Swap"
    status 0
    percent 5 
    user_prize {|t| t.association(:prize)}
    receiver_prize {|t| t.association(:prize)}
    tournament { |t| t.association(:tournament)}
  end
end