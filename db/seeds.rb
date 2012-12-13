# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(:name=>"James", :email=>"james@james.com", :password=>"poker")
u2 = User.create(:name=>"Dani", :email=>"dani@dani.com",:password=>"poker")
u3 = User.create(:name=>"Mike", :email=>"mike@mike.com",:password=>"poker")

t = Tournament.create(:name=>"Main Event", :buy_in=>10000)
t1 = Tournament.create(:name=>"5k 6max", :buy_in=>5000)
t2 = Tournament.create(:name=>"2.5k Shootout", :buy_in=>2500)

p = Prize.create(:user=>u1, :tournament=>t, :amount=> 35000)
p1 = Prize.create(:user=>u2, :tournament=>t1, :amount=>125000)

r = Swap.create(:tournament =>t, :receiver=> u2, :amount=>5, :active=>true, :prize=>p)
r1 = Swap.create(:tournament =>t1, :receiver=> u2, :amount=>5, :active=>true, :prize=>p)
r2 = Swap.create(:tournament =>t2, :receiver=> u2, :amount=>7, :active=>true)
r3 = Swap.create(:tournament =>t,  :receiver=> u2, :amount=>3, :active=>true)
r4 = Swap.create(:tournament =>t1, :receiver=> u2, :amount=>10, :active=>true)
r5 = Lastlonger.create(:tournament =>t, :receiver=> u2, :active=>true)
r6 = Lastlonger.create(:tournament =>t, :receiver=> u2, :active=>true)
r7 = Piece.create(:tournament =>t, :receiver=> u2, :amount=>10, :active=>true)
r8 = Piece.create(:tournament =>t, :receiver=> u2, :amount=>25, :active=>true)



u1.send_request(r)
u1.send_request(r1) 
u1.send_request(r5)
u1.send_request(r7)
u3.send_request(r8)
u3.send_request(r2)
u3.send_request(r3)
u3.send_request(r4)
