# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning the Database"

EventUser.destroy_all
EventCategory.destroy_all
Review.destroy_all
Event.destroy_all
User.destroy_all
Category.destroy_all

puts "Seeding database"

juan = User.create!(email: "juan@lewagon.com", password: "password")
shwetha = User.create!(email: "shwetha@lewagon.com", password: "password")
vytautas = User.create!(email: "vytautas@lewagon.com", password: "password")
lukasz = User.create!(email: "lukasz@lewagon.com", password: "password")
jessica = User.create!(email: "jessica@lewagon.com", password: "password")

puts "users created"

puts "Creating Events"

event1 = Event.create!(
  name: "5 Miles Hike",
  location: "London",
  description: "Easy hike",
  people_limit: 50,
  date: Date.new(2025, 5, 30),
  starts_at: Date.new(2025, 5, 30),
  ends_at: Date.new(2025, 5, 30),
  user_id: juan.id
)

event2 = Event.create!(
  name: "Pub Crawl",
  location: "Berlin",
  description: "Going to pubs",
  people_limit: 250,
  date: Date.new(2025, 6, 11),
  starts_at: Date.new(2025, 6, 11),
  ends_at: Date.new(2025, 6, 11),
  user_id: shwetha.id
)

event3 = Event.create!(
  name: "Marathon",
  location: "Madeira",
  description: "Running competition",
  people_limit: 100,
  date: Date.new(2025, 8, 24),
  starts_at: Date.new(2025, 8, 24),
  ends_at: Date.new(2025, 8, 24),
  user_id: vytautas.id
)

event4 = Event.create!(
  name: "JS Event",
  location: "Paris",
  description: "Master JavaScript",
  people_limit: 500,
  date: Date.new(2025, 10, 2),
  starts_at: Date.new(2025, 10, 2),
  ends_at: Date.new(2025, 10, 2),
  user_id: lukasz.id
)

event5 = Event.create!(
  name: "Car Show",
  location: "Crete",
  description: "Supercars exhibition",
  people_limit: 900,
  date: Date.new(2025, 12, 31),
  starts_at: Date.new(2025, 12, 31),
  ends_at: Date.new(2025, 12, 31),
  user_id: jessica.id
)

puts "Events created"

puts "Creating categories"

category1 = Category.create!(name: "Outdoor Activities")
category2 = Category.create!(name: "Social Events")
category3 = Category.create!(name: "Learning")

puts "Categories created"


puts "Assigning categories to events"

EventCategory.create!(event_id: event1.id, category_id: category1.id)
EventCategory.create!(event_id: event2.id, category_id: category2.id)
EventCategory.create!(event_id: event3.id, category_id: category1.id)
EventCategory.create!(event_id: event4.id, category_id: category3.id)
EventCategory.create!(event_id: event5.id, category_id: category2.id)

puts "Event categories assigned"

puts "Creating event users"

EventUser.create!(user_id: juan.id, event_id: event1.id)
EventUser.create!(user_id: lukasz.id, event_id: event1.id)
EventUser.create!(user_id: vytautas.id, event_id: event2.id)
EventUser.create!(user_id: jessica.id, event_id: event2.id)
EventUser.create!(user_id: shwetha.id, event_id: event3.id)


puts "Event users created"

puts "Creating reviews"

Review.create!(rating: 4, comment: "Great hike!", user_id: juan.id, event_id: event1.id)
Review.create!(rating: 3, comment: "Fun pub crawl.", user_id: jessica.id, event_id: event2.id)
Review.create!(rating: 5.0, comment: "JS event was well organised!", user_id: lukasz.id, event_id: event4.id)

puts "Reviews created"
