//= require jquery
//= require jquery_ujs
//= require bootstrap_sb_admin_base_v2
//= require turbolinks
//= require require_tree .

require("@popperjs/core");

import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';
import { Tooltip } from "bootstrap";
import '../stylesheets/application';

document.addEventListener("turbolinks:load", () => {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new Tooltip(tooltipTriggerEl))
})

Rails.start();
Turbolinks.start();
ActiveStorage.start();
