require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
//= require cookies_eu

import "../stylesheets/application.scss";
// import "../plugins/parallax";
import "../plugins/dragndrop";
import { initSelect2 } from '../plugins/init_select2';
initSelect2();

import { initFlatpickr } from '../plugins/flatpickr'
initFlatpickr();
