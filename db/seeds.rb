# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#LOCATION
makati_city = Location.create(city: "makati")
manila_city = Location.create(city: "manila")
pasig_city = Location.create(city: "pasig")

#CATEGORY
jogging_buddy = Category.create(name:"jogging")
food_buddy = Category.create(name:"food")
study_buddy = Category.create(name:"study")
drinking_buddy = Category.create(name:"drinking")
swimming_buddy = Category.create(name:"swimming")
hiking_buddy = Category.create(name:"hiking")

#USER
for i in 1..40
  user = User.create(email: "user#{i}@gmail.com", name: "User #{i}", gender: "m", password: "foobar123", api_key: "#{i}23")

  for j in 1..3
    activity = Activity.new(date_from: Time.now, name:"Activity #{i}", location: makati_city, preferred_gender:"f", state: :pending, preferred_age_from:20, preferred_age_to: 25, category: food_buddy)
    ActivityOrganizer.create(attributes: activity.attributes, organizer: user)
  end
end
