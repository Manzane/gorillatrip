require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import "../stylesheets/application.scss";
// import "../plugins/parallax";
import "../plugins/dragndrop";
import { initFlatpickr } from '../plugins/flatpickr'
initFlatpickr();
