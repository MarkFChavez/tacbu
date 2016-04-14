# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#LOCATION
makati_city = Location.create(city: "Makati City")
quezon_city = Location.create(city: "Quezon City")
pasig_city = Location.create(city: "Pasig City")


#USER
mark = User.create(email: "mrkchav3z@gmail.com", first_name: "Mark", last_name:"Chavez" , access_token:"CAACEdEose0cBAH2aKftGQ2DUQZBrkKemL5fUIF2zaVFlMKxdsyiU1ETN1CmahDyngw3oE6cf6yMzmjA83pfT45jiaEpRoZBBLEzCB7pamCfJmvpwuBl3GNywyQDrFyNVUqM8ZBE4OUGAxUSZCy1q0Krsmop69R3OAGnpiCBk3Ff6UWXNX1t2rz71uJTWQKZBebGVE40MRYAZDZD", gender:"m", password: "foobar123")

#CATEGORY
jogging_buddy = Category.create(name:"jogging buddy")
food_buddy = Category.create(name:"food buddy")
study_buddy = Category.create(name:"study buddy")
drinking_buddy = Category.create(name:"drinking buddy")
travel_buddy = Category.create(name:"travel buddy")
hiking_buddy = Category.create(name:"hiking buddy")

#ACTIVITY
food_trip = Activity.create(date_from: Time.now, name:"Food trip at Italiannis", location_id: makati_city.id, preferred_gender:"f", state:"pending", preferred_age_from:20, preferred_age_to: 25, category_id:food_buddy.id)

#USER_ACTIVITY
UserActivity.create(user_id:mark.id, activity_id:food_trip.id, role:"owner")


