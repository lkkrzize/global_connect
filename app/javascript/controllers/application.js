import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

function searchLocation(location) {
  fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(location)}`)
    .then(res => res.json())
    .then(data => {
        if (data.length > 0) {
            const lat = data[0].lat;
            const lon = data[0].lon;

            // Redirect to event show page with coordinates
            window.location.href = `/events?lat=${lat}&lon=${lon}`;
        } else {
            alert("Location not found.");
        }
    })
    .catch(error => {
        console.error("Geocoding failed:", error);
        alert("Something went wrong. Please try again.");
    });
}

const search = document.getElementById('search-button')
if (search) {

  search.addEventListener('click', function () {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function (position) {
        const lat = position.coords.latitude;
        const lon = position.coords.longitude;

        // Redirect to show page with current location
        window.location.href = `/events?lat=${lat}&lon=${lon}`;
      }, function () {
        alert("Failed to get your location.");
      });
    } else {
      alert("Geolocation is not supported by this browser.");
    }
  });
}
