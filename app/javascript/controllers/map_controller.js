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
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

 #attachSearchListener() {
    const searchButton = document.getElementById("search-button")

    if (searchButton) {
      searchButton.addEventListener("click", (e) => {
        e.preventDefault()

        if (!this.map) {
          alert("Map not loaded.")
          return
        }

        const bounds = this.map.getBounds()
        const sw = bounds.getSouthWest()
        const ne = bounds.getNorthEast()

        const params = new URLSearchParams({
          sw_lat: sw.lat,
          sw_lng: sw.lng,
          ne_lat: ne.lat,
          ne_lng: ne.lng
        })

        window.location.href = `/search?${params.toString()}`
      })
    }
  }
};