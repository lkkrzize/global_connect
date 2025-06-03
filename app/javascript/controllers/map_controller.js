import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log("hello");

    // Check markers and log if id missing
    this.markersValue.forEach((marker) => {
      console.log("Marker:", marker);
      if (!marker.id) {
        console.error("Marker missing id!", marker);
      }
    });

    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.#setInitialMapView();
    this.#addMarkersToMap();
    this.#attachSearchListener();
  }

   #setInitialMapView() {
    const params = new URLSearchParams(window.location.search);
    const lat = parseFloat(params.get('lat'));
    const lng = parseFloat(params.get('lon')); // note: lon -> lng

    if (!isNaN(lat) && !isNaN(lng)) {
      // Center map on URL coordinates with a zoom level
      this.map.setCenter([lng, lat]);
      this.map.setZoom(14);
    } else if (this.markersValue.length > 0) {
      // Fit map to markers if no URL params
      this.#fitMapToMarkers();
    } else {
      // Default fallback: center on somewhere reasonable or do nothing
      this.map.setCenter([0, 0]);
      this.map.setZoom(2);
    }
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup({
        closeButton: false,
        closeOnClick: false
      }).setHTML(`
        <strong>${marker.name}</strong><br>
        ${marker.details || ''}
      `);

      const mapMarker = new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);

      const markerElement = mapMarker.getElement();

      // Show popup on hover
      markerElement.addEventListener('mouseenter', () => popup.addTo(this.map));
      markerElement.addEventListener('mouseleave', () => popup.remove());

      // Redirect to event show page on click
      markerElement.addEventListener('click', () => {
        if (marker.id) {
          window.location.href = `/events/${marker.id}`;
        } else {
          console.error("Cannot redirect, marker.id is undefined", marker);
        }
      });
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #attachSearchListener() {
    const searchButton = document.getElementById("search-button");

    if (searchButton) {
      searchButton.addEventListener("click", (e) => {
        e.preventDefault();

        if (!navigator.geolocation) {
          alert("Geolocation is not supported by your browser.");
          return;
        }

        navigator.geolocation.getCurrentPosition(
          (position) => {
            const { latitude, longitude } = position.coords;

            const radius = 0.5;
            const sw_lat = latitude - radius;
            const ne_lat = latitude + radius;
            const sw_lng = longitude - radius;
            const ne_lng = longitude + radius;

            const params = new URLSearchParams({
              sw_lat,
              sw_lng,
              ne_lat,
              ne_lng
            });

            window.location.href = `/events?${params.toString()}`;
          },
          (error) => {
            alert("Unable to retrieve your location.");
            console.error(error);
          }
        );
      });
    }
  }
}
