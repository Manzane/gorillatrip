const flatpickr = require("flatpickr");
const French = require("flatpickr/dist/l10n/fr.js").default.fr;
flatpickr.localize(French);

const initFlatpickr = () => {
  flatpickr("#datePicker", {
    altInput: true,
    altFormat: "j F, Y",
  });
}

export { initFlatpickr }
