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


r = Swap.create(:tournament =>t, :receiver=> u2)
r1 = Swap.create(:tournament =>t1, :receiver=> u2)
r2 = Swap.create(:tournament =>t2, :receiver=> u2)
r3 = Swap.create(:tournament =>t,  :receiver=> u2)
r4 = Swap.create(:tournament =>t1, :receiver=> u2)

u1.send_request(r)
u1.send_request(r1) 
u3.send_request(r2)
u3.send_request(r3)
u3.send_request(r4)
