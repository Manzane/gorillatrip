// const flatpickr = require("flatpickr");
// const French = require("flatpickr/dist/l10n/fr.js").default.fr;
// flatpickr.localize(French);
import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const startDateInput = document.getElementById('start');
const endDateInput = document.getElementById('end');

const form = document.getElementById("datepickr-form");
if (form) {

  const initFlatpickr = () => {

    if (endDateInput) {
      flatpickr(startDateInput, {
      altInput: true,
      altFormat: "j F, Y",
      });

      startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        altInput: true,
        altFormat: "j F, Y",
        });
      });
    } else {
      flatpickr(".datePicker", {
        altInput: true,
        altFormat: "j F, Y",
      });
    }
  }
  initFlatpickr();
};
