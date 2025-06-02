import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log("hello")
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#attachSearchListener()
  }

  #addMarkersToMap() {
  this.markersValue.forEach((marker) => {
    // Create a popup with event details
    const popup = new mapboxgl.Popup({
      closeButton: false,
      closeOnClick: false
    }).setHTML(`
      <strong>${marker.name}</strong><br>
      ${marker.details || ''}
    `)

    // Create the marker and add event listeners for hover
    const mapMarker = new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup) // Attach popup to marker
      .addTo(this.map)

    // Show popup on mouse enter
    mapMarker.getElement().addEventListener('mouseenter', () => popup.addTo(this.map))
    // Hide popup on mouse leave
    mapMarker.getElement().addEventListener('mouseleave', () => popup.remove())
    })
   }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #attachSearchListener() {
    const searchButton = document.getElementById("search-button")

    if (searchButton) {
      searchButton.addEventListener("click", (e) => {
        e.preventDefault()

        if (!navigator.geolocation) {
          alert("Geolocation is not supported by your browser.")
          return
        }

        navigator.geolocation.getCurrentPosition(
          (position) => {
            const { latitude, longitude } = position.coords

            // Define a radius (in degrees) around the user location
            const radius = 0.5

            const sw_lat = latitude - radius
            const ne_lat = latitude + radius
            const sw_lng = longitude - radius
            const ne_lng = longitude + radius

            const params = new URLSearchParams({
              sw_lat,
              sw_lng,
              ne_lat,
              ne_lng
            })

            window.location.href = `/events?${params.toString()}`
          },
          (error) => {
            alert("Unable to retrieve your location.")
            console.error(error)
          }
        )
      })
    }
  }
}
