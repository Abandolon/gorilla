import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');


  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/lewagon-airpets/cjt63a1yc10yg1fqnqd6w13j2'
    });

    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // <-- add this
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url(${marker.image_url})`;
      element.style.backgroundSize = 'contain';
      element.style.width = '35px';
      element.style.height = '35px';


      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
        .setHTML(marker.infoWindow))
        .addTo(map);

    });
    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
    };

    if (mapElement) {
      // [ ... ]
      fitMapToMarkers(map, markers);
    }
    const addMarkersToMap = (map, markers) => {
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // <-- add this

        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup) // <-- add this
          .addTo(map);
      });
    };
  }

};

export { initMapbox };

