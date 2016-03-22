# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Airport.delete_all
Airport.create(code: "SFO", location: "San Francisco") # id 1
Airport.create(code: "NYC", location: "New York City") # id 2

#Flight.delete_all

10.times do |n|
  from = n % 2 == 0 ? 1 : 2
  to = n % 2 == 0 ? 2 : 1
  Flight.create(departure_id: from,
	    destination_id: to,
	    duration: rand(1..6),
	    start_date: Faker::Time.forward(10, :day))
end
