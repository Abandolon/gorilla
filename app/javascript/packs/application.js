import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import '../components/style_choice.js';
import '../plugins/flatpickr.js';
import { signupVeteran } from '../plugins/sign_up_veteran';
import { initMapbox } from '../plugins/init_mapbox';
import { scrollLast } from '../plugins/scroll';
// import { initAutocomplete } from '../plugins/init_autocomplete';
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
signupVeteran()
initMapbox();

window.scrollLast = scrollLast;
window.scrollLast();

const map = document.querySelector('#map > div.mapboxgl-canvas-container.mapboxgl-interactive.mapboxgl-touch-drag-pan.mapboxgl-touch-zoom-rotate');
if(map) map.style.position = "absolute";
