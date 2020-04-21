// const flatpickr = require("flatpickr");
// const French = require("flatpickr/dist/l10n/fr.js").default.fr;
// flatpickr.localize(French);
import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const form = document.getElementById("datepickr-form");
if (form) {
  const initFlatpickr = () => {
    flatpickr(".datePicker", {
      altInput: true,
      altFormat: "j F, Y",
    });
  }
  initFlatpickr();
};
