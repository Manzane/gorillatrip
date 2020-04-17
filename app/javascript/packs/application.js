require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")


import "../stylesheets/application.scss";

import "../plugins/dragndrop";
import "../plugins/flatpickr";
import 'bootstrap';

import { initSelect2 } from '../plugins/init_select2';
initSelect2();

// import { initFlatpickr } from '../plugins/flatpickr';
// initFlatpickr();

// import "../plugins/parallax";
