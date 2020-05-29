require "open-uri"
require "yaml"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all # if Rails.env.development?
Bike.destroy_all # if Rails.env.development?
User.destroy_all # if Rails.env.development?
puts 'Delete data from database...'
user1 = User.create!(
  email: "philipp@email.com",
  password: "secret",
  username: "Philipp"
)
user2 = User.create(
  email: "matt@email.com",
  password: "secret",
  username: "Matt"
)

user3 = User.create!(
  email: "yue@email.com",
  password: "secret",
  username: "Yue"
)

user4 = User.create!(
  email: "sina@email.com",
  password: "secret",
  username: "Sina"
)

file = URI.open('https://res.cloudinary.com/detomqnqx/image/upload/v1590669761/mkm5osexpqqsbuziicx8.jpg')
file2 = URI.open('https://res.cloudinary.com/detomqnqx/image/upload/v1590753084/2_Mountainbike_ylnax0.jpg')
file3 = URI.open('https://res.cloudinary.com/detomqnqx/image/upload/v1590753089/3_Vintage-Streetbike_uco5s7.jpg')
# file4 = URI.open('https://res.cloudinary.com/detomqnqx/image/upload/v1590743648/m4c73qud4yb5ft8ug9wlesx2cv3i.jpg')
file5 = URI.open('https://res.cloudinary.com/detomqnqx/image/upload/v1590753083/5_City-Bike_mxwmka.jpg')
file6 = URI.open('https://res.cloudinary.com/detomqnqx/image/upload/v1590753081/6_Bike_of_dreams_ygrts6.jpg')
file7 = URI.open('https://res.cloudinary.com/detomqnqx/image/upload/v1590753081/7_E-Bike_yjahlz.jpg')

bike = Bike.create!(
  name: "Beach Cruiser",
  location: "Berlin",
  description: "A nice, beach-y, cruiser-y bicycle, friend.",
  price_per_day: 10,
  user: user1
  )
  bike.photo.attach(io: file, filename: 'photo')

bike2 = Bike.create(
  name: "Mountain Bike",
  location: "Berlin",
  description: "Do you like mountains? Do you like bikes? How about both?!",
  price_per_day: 20,
  user: user2
)
bike2.photo.attach(io: file2, filename: 'photo')

bike3 = Bike.create(
  name: "Vintage Street Bike",
  location: "Berlin",
  description: "Hipsters unite! You need your morning chai latte? How ya gonna get there, brah? I'll tell ya: street bike!",
  price_per_day: 20,
  user: user3
)
bike3.photo.attach(io: file3, filename: 'photo')

bike4 = Bike.create(
  name: "Red Bike",
  location: "Berlin",
  description: "Your favourite color is red! Mine too. With this bike your next bike tour will be so much fun.",
  price_per_day: 10,
  user: user4
)
# bike4.photo.attach(io: file4, filename: 'photo')

bike5 = Bike.create(
  name: "Awesome City Bike",
  location: "London",
  description: "You are in need of a bike for your next trip to the city? This fantastic bike is the answer to it.",
  price_per_day: 10,
  user: user4
)
bike5.photo.attach(io: file5, filename: 'photo')

bike6 = Bike.create(
  name: "Bike of your dreams",
  location: "London",
  description: "With this bike you will catch the attention from everyone around you!",
  price_per_day: 20,
  user: user4
)
bike6.photo.attach(io: file6, filename: 'photo')

bike7 = Bike.create(
  name: "E-bike",
  location: "London",
  description: "You want to go on a bike tour but don't feel like working out too much..Book this bike.",
  price_per_day: 20,
  user: user4
)
bike7.photo.attach(io: file7, filename: 'photo')

puts 'Bikes created'
puts "You now have #{User.count} users and #{Bike.count} bikes."
