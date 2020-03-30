require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import "../stylesheets/application.scss";
// import "./parallax";
import "./dragndrop";
import { initFlatpickr } from './flatpickr';
initFlatpickr();
