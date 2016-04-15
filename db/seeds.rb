# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def generate_token
  loop do
    token = SecureRandom.hex
    break token unless User.exists?(api_key: token)
  end
end

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

mark = User.create(email: "markchav3z@gmail.com", name: "Mark Chavez", gender: "m", password: "foobar123", api_key: generate_token, image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xal1/v/t1.0-1/p200x200/1928920_1069996369701338_7828787023993601281_n.jpg?oh=e38bb31ce09a44b4c9cb5adc2ff92129&oe=5775BD2F&__gda__=1471411207_5058ef2fdd93464b61fa7b3510ce49b7")

shirl = User.create(email: "smabeza@gmail.com", name: "Shirl Mabeza", gender: "f", password: "foobar123", api_key: generate_token, image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/v/t1.0-1/p200x200/13001201_1282546975092202_6013808257519767591_n.jpg?oh=870b7257d59870f4d9b9884775891bfe&oe=5777D8D5&__gda__=1467273923_6c48354b728f1fb619cebc0b08c0cbd3")

billy = User.create(email: "bnicart@gmail.com", name: "Billy Nicart", gender: "m", password: "foobar123", api_key: generate_token, image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpt1/v/t1.0-1/p200x200/12540555_10207461425607589_2216908520939367107_n.jpg?oh=138a26053880608518772b5556c49800&oe=577D7230&__gda__=1471839164_9c0c04eeb494e9a7f3449d7578973632")

maricar = User.create(email: "mmanabat@gmail.com", name: "Maricar Manabat", gender: "f", password: "foobar123", api_key: generate_token, image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xtl1/v/t1.0-1/p200x200/12795480_1150689781610515_3224199658462158390_n.jpg?oh=22b28e495c26db65fd8711e900ea4406&oe=577D1E81&__gda__=1470973273_232a671c9080c0f7e8abbdf24c663067")

demi = User.create(email: "demi@gmail.com", name: "John Demi Ramiro", gender: "m", password: "foobar123", api_key: generate_token, image: "https://scontent.xx.fbcdn.net/hprofile-xfl1/v/l/t1.0-1/c0.11.50.50/p50x50/11760123_10202992876021918_9137473490555400885_n.jpg?oh=8d465859e4bc7a68b93dc2685a05120b&oe=57836F7F")

ralph = User.create(email: "ralph@gmail.com", name: "Ralph Leonard Ramos", gender: "m", password: "foobar123", api_key: generate_token, image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/p200x200/12705247_1079024405452367_8773586714911846063_n.jpg?oh=031166ecba7c0c210598a0f1527aa9a8&oe=57C06A75&__gda__=1471263545_8dac84f0c0d9e8069fdcfb03ab8dbcb3")

ardee = User.create(email: "ardee@gmail.com", name: "Ardee Aram", gender: "m", password: "foobar123", api_key: generate_token, image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xaf1/v/t1.0-1/p200x200/13001291_10153665196168722_2246152234749607126_n.jpg?oh=bcbe575da192ed16698675a04a165569&oe=577958CD&__gda__=1468161110_2c6b0bfe1fd3a3a0a6b30ac0e63bf4a6")

