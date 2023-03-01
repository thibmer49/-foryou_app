require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning up database..."

# User.destroy_all
# 10.times do
#   User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     pseudo: Faker::Name.name,
#     email: Faker::Internet.email,
#     address: Faker::Address.full_address,
#     password: Faker::Internet.password,
#     phone_number: Faker::PhoneNumber.phone_number_with_country_code,
#     birth_date: Faker::Date.birthday
#   )
# end
Offer.destroy_all
puts "Database cleaned"
12.times do

  Offer.create!(
    user: User.all.sample,
    price_per_day: rand(10..100),
    description: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    address: "16 villa Gaudelet",
    category: Offer::CATEGORY.sample,
    name: Faker::Lorem.sentence
  )
  puts "1 offer created"
end
puts "Offers created"
