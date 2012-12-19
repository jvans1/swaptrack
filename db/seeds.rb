# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(:name=>"James", :email=>"james@james.com", :password=>"poker")
u2 = User.create(:name=>"Dani", :email=>"dani@dani.com",:password=>"poker")


t = Tournament.create(:name=>"Main Event", :buy_in=>10000)
t1 = Tournament.create(:name=>"5k 6max", :buy_in=>5000)
t2 = Tournament.create(:name=>"2.5k HA", :buy_in=>2500)
t3 = Tournament.create(:name=>"Seniors", :buy_in =>1500)
t4 = Tournament.create(:name=>"Nightly 100", :buy_in=>100)
t5 = Tournament.create(:name=>"Satellite", :buy_in =>500)
t6 = Tournament.create(:name=>"2500 6max", :buy_in=>2500)
t7 = Tournament.create(:name=>"4max", :buy_in=>5000)
t8 = Tournament.create(:name=>"1k Turbo", :buy_in=>1000)

p = Prize.create(:user=>u1, :tournament=>t, :amount=> 35000)
p1 = Prize.create(:user=>u2, :tournament=>t1, :amount=>125000)

r = Swap.create(:tournament => t, :receiver=> u2, :percent=>5, :active=>false, :receiver_prize=>p, :status=> 1)
r1 = Swap.create(:tournament => t1, :receiver=> u2, :percent=>5, :active=>false, :user_prize=>p, :status=>1)
r2 = Swap.create(:tournament =>t2, :receiver=> u2, :percent=>7, :active=>true, :status => 0)
r3 = Swap.create(:tournament =>t, :receiver=> u2, :percent=>3, :active=>true, :status => 0)
r4 = Swap.create(:tournament =>t1, :receiver=> u1, :percent=>10, :active=>true, :status => 0)
# # r5 = Lastlonger.create(:tournament =>t, :receiver=> u2, :active=>true)
# # r6 = Lastlonger.create(:tournament =>t, :receiver=> u2, :active=>true)
r7 = Piece.create(:tournament =>t, :receiver => u2, :percent=>10, :active=>true, :status => 0 )
r8 = Piece.create(:tournament =>t, :receiver => u1, :percent=>25, :active=>true, :status => 0)



u1.send_request(r)
u1.send_request(r1)
u1.send_request(r2)
u1.send_request(r3)
u1.send_request(r7)

u2.send_request(r4) 
# u1.send_request(r5)
u2.send_request(r8)



#James User