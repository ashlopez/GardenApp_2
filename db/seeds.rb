# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "seeding DB"

puts "destroy all preivous data"
User.destroy_all

puts "seeding user DB"
user=User.create([
	
	{ user_name: 'Dulce', email:'dulce@gmail.com'}   

	])

puts "seed completed"


puts "seeding DB"

puts "destroy all preivous data"
Garden.destroy_all

puts "seeding garden DB"
garden=Garden.create([
	
	{ name:'South Central Farm', location: '1734 East 41st Street, Los Angeles, CA 90058'}   

	])

puts "seed completed"

puts "seeding DB"

puts "destroy all preivous data"
Vegetable.destroy_all

puts "seeding garden DB"
vegetable=Vegetable.create([
	
	{ name:  'brocolli', quantity: '12'}   

	])

puts "seed completed"