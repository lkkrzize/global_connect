# Global Connect

**Connect, Attend, Experience: Your Gateway to Global Events**

## Overview

Global Connect is a web application for discovering, organising, and attending events. Users can create and manage events, register as attendees, chat with other participants, and leave reviews after events. The platform features event search, interactive maps, user profiles, and a robust review system to enhance community engagement.

## Features

- **Event Discovery:** Search and browse upcoming and past events by name or location.
- **Event Management:** Create, edit, and delete events with details like date, time, location, capacity, and description.
- **User Registration:** Register for events and see who else is attending.
- **Chat:** Event attendees can chat before and during the event (chat is disabled after the event date).
- **Reviews:** Leave and view reviews for events after they have taken place.
- **Interactive Map:** Visualise event locations on an interactive map.
- **User Profiles:** View your hosted and attended events.

## Tech Stack

- **Backend:** Ruby on Rails
- **Database:** PostgreSQL
- **Frontend:** ERB, HTML, CSS, JavaScript
- **Authentication:** Devise
- **Geocoding & Maps:** Mapbox
- **File Uploads:** Active Storage

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/global_connect.git
   cd global_connect
   ```

2. **Install dependencies:**
   ```bash
   bundle install
   yarn install
   ```

3. **Set up the database:**
   ```bash
   rails db:create db:migrate db:seed
   ```

4. **Set up environment variables:**
   - Create a `.env` file and add your `MAPBOX_API_KEY` and any other required keys.

5. **Start the server:**
   ```bash
   rails server
   ```

6. **Visit:**  
   [http://globalconnect.me](http://globalconnect.me)

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License.
