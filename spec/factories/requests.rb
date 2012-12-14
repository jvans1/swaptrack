# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recuest do
  status 0
  user { |a| a.association(:user) }
  receiver { |r| r.association(:user )}
    factory :swap do
      type "Swap"
    end
  end
end


FactoryGirl.define do
    factory :piece do
    type "Piece"
    tournament { |t| t.association(:tournament)}
  end
end