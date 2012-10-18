# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


trucks = Truck.create([
	{ name: 'Truck 1', description: 'A sample Truck!'},
	{ name: 'Truck 2', description: 'A sample Truck!'},
	{ name: 'Truck 3', description: 'A sample Truck!'}
])

trucklr = Truck.find_by_name('Trucklr')

stops = Stop.create([

{start_time: Time.now, end_time: Time.now + 1.day, location: 'Food Truck Lot 1', truck_id: trucklr.id, tweet_text: 'hello'},
{start_time: Time.now, end_time: Time.now + 2.days, location: 'Food Truck Lot 2', truck_id: trucklr.id, tweet_text: 'hello'},
{start_time: Time.now, end_time: Time.now + 3.days, location: 'Food Truck Lot 3', truck_id: trucklr.id, tweet_text: 'hello'},
{start_time: Time.now, end_time: Time.now + 1.week, location: 'Food Truck Lot 4', truck_id: trucklr.id, tweet_text: 'hello'}

])