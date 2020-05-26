# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add also users

# Bike.destroy_all

# Bike.create(name: "Bike 1")
# Bike.create(name: "Bike 2")
# Bike.create(name: "Bike 3")


User.destroy_all if Rails.env.development?
Bike.destroy_all if Rails.env.development?
puts 'Delete data from database...'
user1 = User.create!(
  email: "user_1@email.com",
  password: "password_1",
  username: "user1"
)
user2 = User.create(
  email: "user_2@email.com",
  password: "password_2",
  username: "user2"
)

Bike.create!(
  name: "Beach Cruiser",
  location: "Berlin",
  description: "A nice, beach-y, cruiser-y bicycle, friend.",
  price_per_day: 5,
  user: user1
)

Bike.create(
  name: "Mountain Bike",
  location: "Berlin",
  description: "Do you like mountains? Do you like bikes? How about both?!",
  price_per_day: 10,
  user: user2
)

Bike.create(
  name: "Vintage Street Bike",
  location: "Berlin",
  description: "Hipsters unite! You need your morning chai latte? How ya gonna get there, brah? I'll tell ya: street bike!",
  price_per_day: 25,
  user: user2
)

puts 'Bikes created'
puts "You now have #{User.count} users and #{Bike.count} bikes."
