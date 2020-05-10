// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'jquery-mask-plugin';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$.jMaskGlobals.watchDataMask = true;

$(document).ready(function() {
  $(".change-slide").click(function() {
    var current_slide = this.closest(".slide").id;
    var next_slide = $(this).attr("goTo");

    $("#" + current_slide).toggle();
    $("#" + next_slide).toggle();
    $("#" + current_slide).removeClass("animated");
    $("#" + next_slide).addClass("animated");
  })  
});

setTimeout(function(){
  $(".flash").removeClass("animated fadeInDown");
  $(".flash").addClass("animated fadeOutUp");
}, 5000);
