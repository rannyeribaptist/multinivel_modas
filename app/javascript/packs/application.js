// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
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

$(document).ready(function() {
  var wiper = new Swipe('#sidebar');
  var content = new Swipe('#content');

  wiper.onLeft(function() { sidebar() });
  content.onRight(function() { sidebar() });
  wiper.run();
  content.run();
})

class Swipe {
  constructor(element) {
    this.xDown = null;
    this.yDown = null;
    this.element = typeof(element) === 'string' ? document.querySelector(element) : element;

    this.element.addEventListener('touchstart', function(evt) {
      this.xDown = evt.touches[0].clientX;
      this.yDown = evt.touches[0].clientY;
    }.bind(this), false);

  }

  onLeft(callback) {
    this.onLeft = callback;

    return this;
  }

  onRight(callback) {
    this.onRight = callback;

    return this;
  }

  onUp(callback) {
    this.onUp = callback;

    return this;
  }

  onDown(callback) {
    this.onDown = callback;

    return this;
  }

  handleTouchMove(evt) {
    if ( ! this.xDown || ! this.yDown ) {
      return;
    }

    var xUp = evt.touches[0].clientX;
    var yUp = evt.touches[0].clientY;

    this.xDiff = this.xDown - xUp;
    this.yDiff = this.yDown - yUp;

    if ( Math.abs( this.xDiff ) > Math.abs( this.yDiff ) ) { // Most significant.
      if ( this.xDiff > 0 ) {
        this.onLeft();
      } else {
        this.onRight();
      }
    } else {
      if ( this.yDiff > 0 ) {
        this.onUp();
      } else {
        this.onDown();
      }
    }

    // Reset values.
    this.xDown = null;
    this.yDown = null;
  }

  run() {
    this.element.addEventListener('touchmove', function(evt) {
      this.handleTouchMove(evt).bind(this);
    }.bind(this), false);
  }
}
