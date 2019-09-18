import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';

flatpickr(".date-selection", {
  altInput: true,
  enableTime: true,
});

  // plugins: [
  //   new confirmDate({
  //     confirmIcon: "hello", // your icon's html, if you wish to override
  //     confirmText: "OK ",
  //     showAlways: false,
  //     theme: "light",
  //   }),
  // ],
