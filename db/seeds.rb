# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

7.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Beer.name
  )
end

users = User.all

20.times do
  Wiki.create!(
    title: Faker::StarWars.character,
    body: Faker::StarWars.quote,
    user_id: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
