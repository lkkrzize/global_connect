require 'open-uri'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Cleaning the Database"

Message.destroy_all
Review.destroy_all
EventUser.destroy_all
EventCategory.destroy_all
Event.destroy_all
Category.destroy_all
User.destroy_all

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

jake = User.create!(
  email: "jake@lewagon.com",
  password: "password",
  first_name: "Jake",
  last_name: "Pople",
  bio: "British sailor living full-time on a boat. Combines his love for the sea with a cheeky sense of humour and a surprisingly strong WiFi connection. Once hosted a meeting from the middle of the English Channel during a storm. Not even joking.",
  location: "Brighton, UK",
  profile_name: "sailingjake"
)

marco = User.create!(
  email: "marco@lewagon.com",
  password: "password",
  first_name: "Marco",
  last_name: "Ricci",
  bio: "Italian food lover and pasta perfectionist. Grew up in Naples and claims his nonna invented carbonara. Recently set his kitchen on fire flambéing spaghetti — now known as 'fire-roasted alla Ricci'.",
  location: "Naples, Italy",
  profile_name: "marcopasta"
)

fiona = User.create!(
  email: "fiona@lewagon.com",
  password: "password",
  first_name: "Fiona",
  last_name: "Agnew",
  bio: "Online social butterfly with the world’s worst internet. Hosts vibrant events full of laughter, buffering, and her classic catchphrase: 'Can you hear me now?' Lives for awkward Zoom freeze-frames.",
  location: "Edinburgh, UK",
  profile_name: "fionameetup"
)

deji = User.create!(
  email: "deji@lewagon.com",
  password: "password",
  first_name: "Deji",
  last_name: "Hastrup",
  bio: "OpenAI enthusiast and bug magnet. Always first to discover mysterious errors nobody else can reproduce. Claims his console logs have developed sentience.",
  location: "London, UK",
  profile_name: "dejiAI"
)

ben = User.create!(
  email: "ben@lewagon.com",
  password: "password",
  first_name: "Ben",
  last_name: "McLaren",
  bio: "Software Developer, UX/UI Designer & Club Captain of Outgoing Kobras FC. Wears many hats (literally). Has a yellow-themed life, questionable tea addiction, and suspiciously detailed knowledge of obscure football trivia.",
  location: "Glasgow, UK",
  profile_name: "yellowben"
)

louis = User.create!(
  email: "louis@lewagon.com",
  password: "password",
  first_name: "Louis",
  last_name: "Leslie",
  bio: "Freelancer juggling 3D printing, houseplants, and spreadsheets. Known for giving business pitches while watering succulents. Believes every freelancer should own a mini greenhouse and a label maker.",
  location: "Manchester, UK",
  profile_name: "freelancelou"
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

jake_avatar = URI.open("https://avatars.githubusercontent.com/u/70224830?v=4")
jake.photo.attach(io: jake_avatar, filename: "jake_avatar.jpg", content_type: "image/jpeg")

marco_avatar = URI.open("https://avatars.githubusercontent.com/u/65777698?v=4")
marco.photo.attach(io: marco_avatar, filename: "marco_avatar.jpg", content_type: "image/jpeg")

fiona_avatar = File.open(Rails.root.join("app/assets/images/fiona.jpg"))
fiona.photo.attach(io: fiona_avatar, filename: "fiona_avatar.jpg", content_type: "image/jpeg")

deji_avatar = URI.open("https://avatars.githubusercontent.com/u/72709071?v=4")
deji.photo.attach(io: deji_avatar, filename: "deji_avatar.jpg", content_type: "image/jpeg")

ben_avatar = URI.open("https://avatars.githubusercontent.com/u/47673163?v=4")
ben.photo.attach(io: ben_avatar, filename: "ben_avatar.jpg", content_type: "image/jpeg")

louis_avatar = URI.open("https://avatars.githubusercontent.com/u/31960969?v=4")
louis.photo.attach(io: louis_avatar, filename: "louis_avatar.jpg", content_type: "image/jpeg")


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
  name: "5 Miles Hike in Richmond Park 🏃‍♂️",
  location: "London, UK",
  description: "Easy morning hike through Richmond Park. Perfect for beginners! We'll meet at the main gate and explore the park's beautiful trails. Bring water and comfortable shoes.",
  people_limit: 15,
  date: Date.new(2025, 5, 25),
  starts_at: Time.new(2025, 5, 25, 9, 0),
  ends_at: Time.new(2025, 5, 25, 12, 0),
  user_id: juan.id,
  category_ids: [outdoor.id, sports.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749055229/A_vibrant_cover_picture_for_the_event_5_Miles_Hike_in_Richmond_Park._Easy_morning_hike_through_Rich_grsfv1.jpg"
)

event2 = Event.create!(
  name: "Pub Crawl 🍻",
  location: "Berlin, Germany",
  description: "Explore Berlin's best craft beer scene! We'll visit 4 amazing pubs in Kreuzberg and Friedrichshain. Great way to meet new people and taste local brews.",
  people_limit: 25,
  date: Date.new(2025, 6, 15),
  starts_at: Time.new(2025, 6, 15, 19, 0),
  ends_at: Time.new(2025, 6, 15, 23, 30),
  user_id: shwetha.id,
  category_ids: [social.id, food.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749055080/A_vibrant_cover_picture_for_the_event_Pub_Crawl._Explore_Berlin_s_best_craft_beer_scene_We_ll_visi_zlea6z.jpg"
)

event3 = Event.create!(
  name: "Trail Marathon 🥈",
  location: "Funchal, Madeira",
  description: "Challenging trail marathon through Madeira's stunning landscapes. For experienced runners only! Registration includes medal and post-race meal.",
  people_limit: 100,
  date: Date.new(2025, 8, 24),
  starts_at: Time.new(2025, 8, 24, 7, 0),
  ends_at: Time.new(2025, 8, 24, 15, 0),
  user_id: vytautas.id,
  category_ids: [outdoor.id, sports.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749054802/A_vibrant_cover_picture_for_the_event_JavaScript_Masterclass._Showcase_a_modern_sleek_design_with_ubfq0k.jpg"
)

event4 = Event.create!(
  name: "JavaScript Masterclass ⚙",
  location: "Paris, France",
  description: "Deep dive into modern JavaScript ES6+ features. Workshop includes hands-on coding, best practices, and Q&A session. Bring your laptop!",
  people_limit: 30,
  date: Date.new(2025, 7, 12),
  starts_at: Time.new(2025, 7, 12, 10, 0),
  ends_at: Time.new(2025, 7, 12, 17, 0),
  user_id: lukasz.id,
  category_ids: [learning.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749054802/A_vibrant_cover_picture_for_the_event_JavaScript_Masterclass._Showcase_a_modern_sleek_design_with_ubfq0k.jpg"
)

event5 = Event.create!(
  name: "Classic Car Show Crete 🏎",
  location: "Heraklion, Crete",
  description: "Vintage and supercar exhibition featuring rare European classics. Perfect for car enthusiasts! Food trucks and live music included.",
  people_limit: 200,
  date: Date.new(2025, 9, 20),
  starts_at: Time.new(2025, 9, 20, 11, 0),
  ends_at: Time.new(2025, 9, 20, 18, 0),
  user_id: jessica.id,
  category_ids: [social.id, food.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749054615/A_vibrant_cover_picture_for_the_event_Classic_Car_Show_Crete._The_image_should_feature_a_stunning_cr3gsk.jpg"
)

event6 = Event.create!(
  name: "Photography Walk 📸",
  location: "Prague, Czech Republic",
  description: "Capture Prague's golden hour magic! We'll walk through Old Town and Lesser Town, sharing photography tips and techniques.",
  people_limit: 12,
  date: Date.new(2025, 6, 28),
  starts_at: Time.new(2025, 6, 28, 18, 0),
  ends_at: Time.new(2025, 6, 28, 21, 0),
  user_id: juan.id,
  category_ids: [outdoor.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749054394/cover_picture_for_event_name_photograhy_walk._Capture_Prague_s_golden_hour_magic_We_ll_walk_throug_tc5ujx.jpg"
)

event7 = Event.create!(
  name: "Tech Meetup 💻",
  location: "Amsterdam, Netherlands",
  description: "Monthly tech meetup discussing latest trends in web development, AI, and startups. Networking drinks included!",
  people_limit: 50,
  date: Date.new(2025, 6, 8),
  starts_at: Time.new(2025, 6, 8, 18, 30),
  ends_at: Time.new(2025, 6, 8, 22, 0),
  user_id: shwetha.id,
  category_ids: [learning.id, social.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749054202/A_vibrant_and_dynamic_event_cover_picture_for_a_Tech_Meetup_featuring_a_diverse_group_of_people_eng_cblmda.jpg"
)

event8 = Event.create!(
  name: "Sailing with Jake: Bring Sea Legs & Snacks 🌊",
  location: "Brighton Marina, UK",
  description: "Join Jake aboard his (mostly) waterproof sailboat for a nautical adventure. Expect British banter, dramatic wind forecasts, and a retelling of the time he accidentally invited seagulls to brunch.",
  people_limit: 8,
  date: Date.new(2025, 3, 15),
  starts_at: Time.new(2025, 3, 15, 10, 0),
  ends_at: Time.new(2025, 3, 15, 15, 0),
  user_id: jake.id,
  category_ids: [outdoor.id, social.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749054037/A_vibrant_scene_of_a_sailboat_on_a_sunny_day_with_Jake_Jake_is_a_guy_with_black_glasses_dark_brown_1_shw1tj.jpg"
)

event9 = Event.create!(
  name: "Pasta Party: Cooking with Marco 🍝",
  location: "Naples, Italy",
  description: "Make fresh pasta with Marco and hear how he once confused salt for sugar in front of a TV chef. Includes wine, chaos, and exactly zero measuring cups.",
  people_limit: 12,
  date: Date.new(2025, 3, 28),
  starts_at: Time.new(2025, 3, 28, 17, 0),
  ends_at: Time.new(2025, 3, 28, 20, 0),
  user_id: marco.id,
  category_ids: [food.id, social.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749053288/A_lively_pasta_party_scene_in_a_cozy_kitchen_with_friends_and_family_gathered_around_a_large_wooden_uqlm6x.jpg"
)

event10 = Event.create!(
  name: "Online MeetUp by Fiona 🤝",
  location: "Zoom (ish)",
  description: "Hosted by Fiona. This is a *virtual* event that may or may not happen depending on her internet. Icebreakers, games, and at least one participant stuck saying 'Hellooooo?' for 5 minutes.",
  people_limit: 20,
  date: Date.new(2025, 4, 5),
  starts_at: Time.new(2025, 4, 5, 19, 0),
  ends_at: Time.new(2025, 4, 5, 21, 0),
  user_id: fiona.id,
  category_ids: [social.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749053133/A_virtual_meeting_scene_with_diverse_participants_on_a_video_call_each_in_their_own_unique_home_off_jsjcsr.jpg"
)

event11 = Event.create!(
  name: "OpenAI Night 👩‍💻",
  location: "London, UK",
  description: "Deji leads a workshop on AI — assuming he can get past the ‘unexpected token’ error that’s haunted him for weeks. Debugging live and possibly crying on the inside.",
  people_limit: 25,
  date: Date.new(2025, 4, 18),
  starts_at: Time.new(2025, 4, 18, 18, 0),
  ends_at: Time.new(2025, 4, 18, 20, 30),
  user_id: deji.id,
  category_ids: [learning.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749052983/A_vibrant_and_dynamic_cover_picture_for_an_event_called_OpenAI_Night._The_image_should_feature_a_f_se79gf.jpg"
)

event12 = Event.create!(
  name: "Football, Frontend & Fifty Cups of Tea ⚽☕",
  location: "Glasgow, UK",
  description: "Ben mixes code and football talk in this caffeinated hangout. Come for the React tips, stay for the tea — and don’t mention VAR unless you want a lecture.",
  people_limit: 20,
  date: Date.new(2025, 4, 29),
  starts_at: Time.new(2025, 4, 29, 16, 0),
  ends_at: Time.new(2025, 4, 29, 19, 0),
  user_id: ben.id,
  category_ids: [learning.id, social.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749052691/A_vibrant_cover_image_for_the_event_Football_Frontend_Fifty_Cups_of_Tea_._The_image_should_fe_xizmiv.jpg"
)

event13 = Event.create!(
  name: "Freelancing & Ferns: A Business Jungle 🌱",
  location: "Manchester, UK",
  description: "Louis shares freelancing wisdom surrounded by houseplants. Hear about his 3D printing mishaps, how he once invoiced the wrong client, and why plant care is essential for business growth.",
  people_limit: 15,
  date: Date.new(2025, 5, 12),
  starts_at: Time.new(2025, 5, 12, 17, 30),
  ends_at: Time.new(2025, 5, 12, 19, 30),
  user_id: louis.id,
  category_ids: [learning.id, social.id],
  image_url: "https://res.cloudinary.com/dsdn6atc1/image/upload/v1749052355/cover_image_for_the_eventFreelancing_Ferns_A_Business_Jungle_1_s8keur.jpg"
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

# Event 3: Trail Marathon (Upcoming)
EventUser.create!(user_id: jessica.id, event_id: event3.id)
EventUser.create!(user_id: shwetha.id, event_id: event3.id)
EventUser.create!(user_id: ben.id, event_id: event3.id)

# Event 4: JavaScript Masterclass (Upcoming)
EventUser.create!(user_id: shwetha.id, event_id: event4.id)
EventUser.create!(user_id: vytautas.id, event_id: event4.id)
EventUser.create!(user_id: jessica.id, event_id: event4.id)
EventUser.create!(user_id: lukasz.id, event_id: event4.id)
EventUser.create!(user_id: marco.id, event_id: event4.id)

# Event 5: Classic Car Show Crete (Upcoming)
EventUser.create!(user_id: lukasz.id, event_id: event5.id)
EventUser.create!(user_id: vytautas.id, event_id: event5.id)
EventUser.create!(user_id: louis.id, event_id: event5.id)

# Event 6: Photography Walk (Upcoming)
EventUser.create!(user_id: jessica.id, event_id: event6.id)
EventUser.create!(user_id: shwetha.id, event_id: event6.id)
EventUser.create!(user_id: deji.id, event_id: event6.id)

# Event 7: Tech Meetup (Upcoming)
EventUser.create!(user_id: juan.id, event_id: event7.id)
EventUser.create!(user_id: lukasz.id, event_id: event7.id)
EventUser.create!(user_id: jessica.id, event_id: event7.id)
EventUser.create!(user_id: shwetha.id, event_id: event7.id)
EventUser.create!(user_id: ben.id, event_id: event7.id)

# Event 8: Sailing with Jake (Upcoming)
EventUser.create!(user_id: jake.id, event_id: event8.id)
EventUser.create!(user_id: marco.id, event_id: event8.id)
EventUser.create!(user_id: fiona.id, event_id: event8.id)

# Event 9: Pasta Party with Marco (Upcoming)
EventUser.create!(user_id: marco.id, event_id: event9.id)
EventUser.create!(user_id: fiona.id, event_id: event9.id)
EventUser.create!(user_id: louis.id, event_id: event9.id)

# Event 10: Online Meetup by Fiona (Upcoming)
EventUser.create!(user_id: fiona.id, event_id: event10.id)
EventUser.create!(user_id: deji.id, event_id: event10.id)
EventUser.create!(user_id: ben.id, event_id: event10.id)

# Event 11: OpenAI Night (Upcoming)
EventUser.create!(user_id: deji.id, event_id: event11.id)
EventUser.create!(user_id: ben.id, event_id: event11.id)
EventUser.create!(user_id: louis.id, event_id: event11.id)

# Event 12: Football, Frontend & Fifty Cups of Tea (Upcoming)
EventUser.create!(user_id: ben.id, event_id: event12.id)
EventUser.create!(user_id: louis.id, event_id: event12.id)
EventUser.create!(user_id: jake.id, event_id: event12.id)

# Event 13: Freelancing & Ferns (Upcoming)
EventUser.create!(user_id: louis.id, event_id: event13.id)
EventUser.create!(user_id: jake.id, event_id: event13.id)
EventUser.create!(user_id: marco.id, event_id: event13.id)

puts "Event users created"


puts "Creating reviews for past events"

Review.create!(rating: 5, comment: "Amazing hike! Juan was a great guide and the weather was perfect. Already looking forward to the next one!", user_id: shwetha.id, event_id: event1.id)
Review.create!(rating: 4, comment: "Really enjoyed the trail and meeting new people. The pace was just right for beginners. Highly recommend!", user_id: lukasz.id, event_id: event1.id)
Review.create!(rating: 5, comment: "Perfect morning activity! Great photos and even better company. Thanks for organizing Juan! 📸",
 user_id: vytautas.id, event_id: event1.id)
Review.create!(
  rating: 5,
  comment: "Jake's sailing knowledge is incredible, even if he almost lost his tea *and* his guests overboard mid-turn 😂. Would definitely get shipwrecked with him again.",
  user_id: marco.id,
  event_id: event8.id
)

Review.create!(
  rating: 5,
  comment: "Marco’s pasta night was top-tier. That said, he *did* set off the smoke alarm boiling water somehow. Italians, explain yourselves 🍝🔥",
  user_id: fiona.id,
  event_id: event9.id
)

Review.create!(
  rating: 4,
  comment: "Fiona’s virtual hangout was lovely… once her WiFi decided to attend the event. Spent the first 15 mins chatting with her frozen face 😅",
  user_id: deji.id,
  event_id: event10.id
)

Review.create!(
  rating: 3,
  comment: "Deji gave a passionate talk on OpenAI but spent 45 minutes debugging a typo while claiming it was a ‘model limitation’. Classic dev energy 💻😂",
  user_id: ben.id,
  event_id: event11.id
)

Review.create!(
  rating: 5,
  comment: "Ben ran the most stylish event I’ve been to—fonts on point, tea in hand, and even a slide dedicated to Kobras FC. Who else mixes CSS with football? ⚽🎨",
  user_id: louis.id,
  event_id: event12.id
)

Review.create!(
  rating: 5,
  comment: "Louis was so smooth talking about freelancing I almost signed a client during the Q&A. Now I just need to 3D print myself a career. 🌱🖨️",
  user_id: jake.id,
  event_id: event13.id
)

puts "Reviews created"

puts "Creating group chat messages"

# Messages for the past event Hike
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

Message.create!(
  content: "Hope you all packed snacks—especially you, Ben. No one’s sharing again. 😆",
  user_id: fiona.id,
  event_id: event1.id,
  created_at: 1.day.ago + 1.hour
)

Message.create!(
  content: "Oi! I bring *vibes*, not snacks. Besides, Fiona’s protein bars taste like cardboard. 😂",
  user_id: ben.id,
  event_id: event1.id,
  created_at: 1.day.ago + 2.hours
)

Message.create!(
  content: "If I hear one more complaint about uphill climbs, I'm leaving you all behind. 💪⛰️",
  user_id: marco.id,
  event_id: event1.id,
  created_at: 1.day.ago + 3.hours
)

Message.create!(
  content: "Marco saying that as if he didn’t wheeze halfway up last time… receipts incoming 📸",
  user_id: louis.id,
  event_id: event1.id,
  created_at: 1.day.ago + 4.hours
)

Message.create!(
  content: "Can we all agree now: Deji’s in charge of directions. No more accidental 'shortcuts'.",
  user_id: jake.id,
  event_id: event1.id,
  created_at: 1.day.ago + 5.hours
)

Message.create!(
  content: "In my defense, Google Maps betrayed me. But fine—next time I’m bringing a compass. 🧭",
  user_id: deji.id,
  event_id: event1.id,
  created_at: 1.day.ago + 6.hours
)

# Messages for Trail Marathon
Message.create!([
  {content: "Ready to run like my code depends on it! 🏃‍♀️", user_id: jessica.id, event_id: event3.id, created_at: 3.days.ago},
  {content: "If I collapse, just keep running and don’t look back 😂", user_id: shwetha.id, event_id: event3.id, created_at: 2.days.ago}
])

# Messages for Classic Car Show Crete
Message.create!([
  {content: "Gonna pretend I know car models and impress everyone 😎", user_id: lukasz.id, event_id: event5.id, created_at: 5.days.ago},
  {content: "Food trucks + vintage cars = best combo ever", user_id: vytautas.id, event_id: event5.id, created_at: 4.days.ago}
])

# Messages for Photography Walk

Message.create!([
  {content: "Golden hour and good company? Count me in! 📷", user_id: jessica.id, event_id: event6.id, created_at: 6.days.ago},
  {content: "Trying to get that perfect shot without tripping over cobblestones 😅", user_id: shwetha.id, event_id: event6.id, created_at: 5.days.ago}
])

# Messages for Sailing with Jake
Message.create!([
  {content: "Bring your sea legs, snacks, and your best British banter 🇬🇧", user_id: jake.id, event_id: event8.id, created_at: 8.days.ago},
  {content: "Is seasickness included in the itinerary? Asking for a friend 🤢", user_id: marco.id, event_id: event8.id, created_at: 7.days.ago}
])

# Messages for Pasta Party with Marco
Message.create!([
  {content: "Marco claims his nonna invented carbonara, but I’m here for the wine 🍷", user_id: marco.id, event_id: event9.id, created_at: 9.days.ago},
  {content: "I promise not to burn the kitchen this time! No guarantees though 🔥", user_id: fiona.id, event_id: event9.id, created_at: 8.days.ago}
])

# Messages for Online Meetup by Fiona
Message.create!([
  {content: "If my WiFi dies, just pretend I’m saying something deep 🫠", user_id: fiona.id, event_id: event10.id, created_at: 10.days.ago},
  {content: "Hello? Is this thing on? Still here, I swear! 😅", user_id: deji.id, event_id: event10.id, created_at: 9.days.ago}
])

# Messages for OpenAI Night
Message.create!([
  {content: "Debugging live on stage – the ultimate test of nerves 😬", user_id: deji.id, event_id: event11.id, created_at: 11.days.ago},
  {content: "Cheering for you from the audience, just don’t cry on stage! 😂", user_id: ben.id, event_id: event11.id, created_at: 10.days.ago}
])

# Messages for Football, Frontend & Fifty Cups of Tea ⚽☕
Message.create!([
  {content: "Ready to mix React components with football tactics! ⚽", user_id: ben.id, event_id: event12.id, created_at: 12.days.ago},
  {content: "Don’t mention VAR or you’ll get the full lecture! ☕", user_id: louis.id, event_id: event12.id, created_at: 11.days.ago}
])

# Messages for Freelancing & Ferns
Message.create!([
  {content: "If anyone needs me, I’ll be talking to my plants 🌿", user_id: louis.id, event_id: event13.id, created_at: 13.days.ago},
  {content: "Can I invoice a fern? Asking for a freelancer in need. 😄", user_id: jake.id, event_id: event13.id, created_at: 12.days.ago}
])

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
