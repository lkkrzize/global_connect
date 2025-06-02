require 'open-uri'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Cleaning the Database"

Message.destroy_all
EventUser.destroy_all
EventCategory.destroy_all
Review.destroy_all
Event.destroy_all
User.destroy_all
Category.destroy_all

puts "Seeding database"

juan = User.create!(
  email: "juan@lewagon.com",
  password: "password",
  first_name: "Juan",
  last_name: "Lopez",
  bio: "Product and industrial design graduate from Central Saint Martins. Worked as a pizza chef while studying and now learning to code to become a more desirable hire. Love exploring new cities through hiking and always up for good food conversations! Passionate about discovering hidden gems while traveling across Europe.",
  location: "Madrid, Spain",
  profile_name: "juanlopez003"
)

shwetha = User.create!(
  email: "shwetha@lewagon.com",
  password: "password",
  first_name: "Shwetha",
  last_name: "Marumada",
  bio: "Tech enthusiast passionate about Web development and AI. Ex-software engineer who took a career break and now eager to upgrade my skillsets and return to work. Love meeting new people and exchanging ideas - always up for a good tech discussion over coffee! Dream of attending tech conferences around the world.",
  location: "London, UK",
  profile_name: "shwetha-m"
)

vytautas = User.create!(
  email: "vytautas@lewagon.com",
  password: "password",
  first_name: "Vytautas",
  last_name: "Briauka",
  bio: "Former assistant site manager transitioning into web development. Passionate about technology and coding, looking to apply my project coordination skills and creativity to build innovative solutions. When not coding, I love staying active with running and exploring the Baltic coast. Always planning my next adventure race in different countries!",
  location: "Vilnius, Lithuania",
  profile_name: "Vytautas2025"
)

lukasz = User.create!(
  email: "lukasz@lewagon.com",
  password: "password",
  first_name: "Lukasz",
  last_name: "Krzizek",
  bio: "Full-stack developer passionate about clean code and mountaineering. Born in Poland, love teaching others about programming and organizing tech meetups. Always looking for the best hikes and coding communities while traveling through Europe.",
  location: "Wroclaw, Poland",
  profile_name: "lkkrzize"
)

jessica = User.create!(
  email: "jessica@lewagon.com",
  password: "password",
  first_name: "Jessica",
  last_name: "Estrella",
  bio: "Account Manager and Event Management professional transitioning into web development. Worked closely with development teams and found myself wanting to learn more about coding and testing. After Le Wagon, I want to work as a Web Developer in a company that represents who I am and what I believe in. Love organizing events and discovering new destinations for unique experiences!",
  location: "Berlin, Germany",
  profile_name: "JessEstrella"
)

puts "Adding profile photos..."

# Attach profile photos from GitHub avatars
juan_avatar = URI.open("https://avatars.githubusercontent.com/u/204338792?v=4")
juan.photo.attach(io: juan_avatar, filename: "juan_avatar.jpg", content_type: "image/jpeg")

shwetha_avatar = URI.open("https://avatars.githubusercontent.com/u/25467901?v=4")
shwetha.photo.attach(io: shwetha_avatar, filename: "shwetha_avatar.jpg", content_type: "image/jpeg")

vytautas_avatar = URI.open("https://avatars.githubusercontent.com/u/204168685?v=4")
vytautas.photo.attach(io: vytautas_avatar, filename: "vytautas_avatar.jpg", content_type: "image/jpeg")

lukasz_avatar = URI.open("https://avatars.githubusercontent.com/u/64506720?v=4")
lukasz.photo.attach(io: lukasz_avatar, filename: "lukasz_avatar.jpg", content_type: "image/jpeg")

jessica_avatar = URI.open("https://avatars.githubusercontent.com/u/204341762?v=4")
jessica.photo.attach(io: jessica_avatar, filename: "jessica_avatar.jpg", content_type: "image/jpeg")

puts "#{User.count} users created with profile photos!"

puts "Creating Categories"

outdoor = Category.create!(name: "Outdoor Activities")
social = Category.create!(name: "Social Events")
learning = Category.create!(name: "Learning")
food = Category.create!(name: "Food & Drinks")
sports = Category.create!(name: "Sports")

puts "Categories created"

puts "Creating Events"

event1 = Event.create!(
  name: "5 Miles Hike in Richmond Park",
  location: "London, UK",
  description: "Easy morning hike through Richmond Park. Perfect for beginners! We'll meet at the main gate and explore the park's beautiful trails. Bring water and comfortable shoes.",
  people_limit: 15,
  date: Date.new(2025, 5, 25),
  starts_at: Time.new(2025, 5, 25, 9, 0),
  ends_at: Time.new(2025, 5, 25, 12, 0),
  user_id: juan.id,
  category_ids: [outdoor.id, sports.id]
)

event2 = Event.create!(
  name: "Berlin Pub Crawl",
  location: "Berlin, Germany",
  description: "Explore Berlin's best craft beer scene! We'll visit 4 amazing pubs in Kreuzberg and Friedrichshain. Great way to meet new people and taste local brews.",
  people_limit: 25,
  date: Date.new(2025, 6, 15),
  starts_at: Time.new(2025, 6, 15, 19, 0),
  ends_at: Time.new(2025, 6, 15, 23, 30),
  user_id: shwetha.id,
  category_ids: [social.id, food.id]
)

event3 = Event.create!(
  name: "Madeira Trail Marathon",
  location: "Funchal, Madeira",
  description: "Challenging trail marathon through Madeira's stunning landscapes. For experienced runners only! Registration includes medal and post-race meal.",
  people_limit: 100,
  date: Date.new(2025, 8, 24),
  starts_at: Time.new(2025, 8, 24, 7, 0),
  ends_at: Time.new(2025, 8, 24, 15, 0),
  user_id: vytautas.id,
  category_ids: [outdoor.id, sports.id]
)

event4 = Event.create!(
  name: "JavaScript Masterclass",
  location: "Paris, France",
  description: "Deep dive into modern JavaScript ES6+ features. Workshop includes hands-on coding, best practices, and Q&A session. Bring your laptop!",
  people_limit: 30,
  date: Date.new(2025, 7, 12),
  starts_at: Time.new(2025, 7, 12, 10, 0),
  ends_at: Time.new(2025, 7, 12, 17, 0),
  user_id: lukasz.id,
  category_ids: [learning.id]
)

event5 = Event.create!(
  name: "Classic Car Show Crete",
  location: "Heraklion, Crete",
  description: "Vintage and supercar exhibition featuring rare European classics. Perfect for car enthusiasts! Food trucks and live music included.",
  people_limit: 200,
  date: Date.new(2025, 9, 20),
  starts_at: Time.new(2025, 9, 20, 11, 0),
  ends_at: Time.new(2025, 9, 20, 18, 0),
  user_id: jessica.id,
  category_ids: [social.id, food.id]
)

event6 = Event.create!(
  name: "Photography Walk Prague",
  location: "Prague, Czech Republic",
  description: "Capture Prague's golden hour magic! We'll walk through Old Town and Lesser Town, sharing photography tips and techniques.",
  people_limit: 12,
  date: Date.new(2025, 6, 28),
  starts_at: Time.new(2025, 6, 28, 18, 0),
  ends_at: Time.new(2025, 6, 28, 21, 0),
  user_id: juan.id,
  category_ids: [outdoor.id]
)

event7 = Event.create!(
  name: "Amsterdam Tech Meetup",
  location: "Amsterdam, Netherlands",
  description: "Monthly tech meetup discussing latest trends in web development, AI, and startups. Networking drinks included!",
  people_limit: 50,
  date: Date.new(2025, 6, 8),
  starts_at: Time.new(2025, 6, 8, 18, 30),
  ends_at: Time.new(2025, 6, 8, 22, 0),
  user_id: shwetha.id,
  category_ids: [learning.id, social.id]
)

puts "Events created with categories assigned"

puts "Creating event registrations"

# Past event attendees
EventUser.create!(user_id: shwetha.id, event_id: event1.id)
EventUser.create!(user_id: lukasz.id, event_id: event1.id)
EventUser.create!(user_id: vytautas.id, event_id: event1.id)

# Upcoming events - where users are registering for events
EventUser.create!(user_id: juan.id, event_id: event2.id)
EventUser.create!(user_id: vytautas.id, event_id: event2.id)
EventUser.create!(user_id: lukasz.id, event_id: event2.id)

EventUser.create!(user_id: jessica.id, event_id: event3.id)
EventUser.create!(user_id: shwetha.id, event_id: event3.id)

EventUser.create!(user_id: shwetha.id, event_id: event4.id)
EventUser.create!(user_id: vytautas.id, event_id: event4.id)
EventUser.create!(user_id: jessica.id, event_id: event4.id)

EventUser.create!(user_id: lukasz.id, event_id: event5.id)
EventUser.create!(user_id: vytautas.id, event_id: event5.id)

EventUser.create!(user_id: jessica.id, event_id: event6.id)
EventUser.create!(user_id: shwetha.id, event_id: event6.id)

EventUser.create!(user_id: juan.id, event_id: event7.id)
EventUser.create!(user_id: lukasz.id, event_id: event7.id)
EventUser.create!(user_id: jessica.id, event_id: event7.id)

puts "Event users created"

puts "Creating reviews for past events"

Review.create!(rating: 5, comment: "Amazing hike! Juan was a great guide and the weather was perfect. Already looking forward to the next one!", user_id: shwetha.id, event_id: event1.id)
Review.create!(rating: 4, comment: "Really enjoyed the trail and meeting new people. The pace was just right for beginners. Highly recommend!", user_id: lukasz.id, event_id: event1.id)
Review.create!(rating: 5, comment: "Perfect morning activity! Great photos and even better company. Thanks for organizing Juan! 📸", user_id: vytautas.id, event_id: event1.id)

puts "Reviews created"

puts "Creating group chat messages"

# Messages for the past event event1
Message.create!(
  content: "Hey everyone! Weather looks amazing for tomorrow's hike ☀️ Really excited to meet you all!",
  user_id: juan.id,
  event_id: event1.id,
  created_at: 1.day.ago
)

Message.create!(
  content: "First time doing a group hike... should I bring anything special? 🥾",
  user_id: shwetha.id,
  event_id: event1.id,
  created_at: 20.hours.ago
)

Message.create!(
  content: "Just water and good shoes! I'll have some trail mix to share 🥜",
  user_id: juan.id,
  event_id: event1.id,
  created_at: 19.hours.ago
)

Message.create!(
  content: "Perfect! Bringing my camera for some nature shots 📸",
  user_id: vytautas.id,
  event_id: event1.id,
  created_at: 18.hours.ago
)

Message.create!(
  content: "Nice! I'm into photography too, maybe we can swap some tips",
  user_id: lukasz.id,
  event_id: event1.id,
  created_at: 17.hours.ago
)

# Messages for upcoming event2 - pub crawl
Message.create!(
  content: "Welcome to the Berlin pub crawl crew! 🍺 Ready to explore some hidden gems?",
  user_id: shwetha.id,
  event_id: event2.id,
  created_at: 2.hours.ago
)

Message.create!(
  content: "So pumped! Any beer recommendations for a newbie? 🍻",
  user_id: juan.id,
  event_id: event2.id,
  created_at: 1.hour.ago
)

Message.create!(
  content: "Berlin's got incredible craft beer scene! We'll start easy and work our way up 😊",
  user_id: lukasz.id,
  event_id: event2.id,
  created_at: 45.minutes.ago
)

Message.create!(
  content: "Should we grab some food first? I know this amazing currywurst spot nearby!",
  user_id: vytautas.id,
  event_id: event2.id,
  created_at: 30.minutes.ago
)

# Messages for event4 JS event
Message.create!(
  content: "JS workshop prep time! Make sure you've got VS Code and Node installed 💻",
  user_id: lukasz.id,
  event_id: event4.id,
  created_at: 3.days.ago
)

Message.create!(
  content: "All set! What ES6 features are we covering? Super excited! 🚀",
  user_id: shwetha.id,
  event_id: event4.id,
  created_at: 2.days.ago
)

Message.create!(
  content: "Async/await, destructuring, modules... basically the good stuff! Bring any projects you're stuck on",
  user_id: lukasz.id,
  event_id: event4.id,
  created_at: 2.days.ago
)

Message.create!(
  content: "Async stuff is exactly what I need help with! This is going to be so useful 🙌",
  user_id: jessica.id,
  event_id: event4.id,
  created_at: 1.day.ago
)

# Messages for Amsterdam tech meetup event7
Message.create!(
  content: "AI in web dev - this month's topic is going to be incredible! Who's got burning questions? 🤖",
  user_id: shwetha.id,
  event_id: event7.id,
  created_at: 5.days.ago
)

Message.create!(
  content: "I've got SO many questions about AI APIs! This timing is perfect 💭",
  user_id: juan.id,
  event_id: event7.id,
  created_at: 4.days.ago
)

Message.create!(
  content: "Actually built a small AI app recently... mind if I demo it? 🛠️",
  user_id: lukasz.id,
  event_id: event7.id,
  created_at: 3.days.ago
)

Message.create!(
  content: "Yes! Live demos are the best part of these meetups 👏",
  user_id: shwetha.id,
  event_id: event7.id,
  created_at: 3.days.ago
)

Message.create!(
  content: "I'll bring stroopwafels! Tech talks are better with snacks 🍪",
  user_id: jessica.id,
  event_id: event7.id,
  created_at: 2.days.ago
)

puts "Messages created"

puts

puts "  Database seeded successfully!"
puts ""
puts "  Users: #{User.count}"
puts "  Events: #{Event.count}"
puts "  Categories: #{Category.count}"
puts "  Event Registrations: #{EventUser.count}"
puts "  Reviews: #{Review.count}"
puts "  Messages: #{Message.count}"
puts "  Event Categories: #{EventCategory.count}"
