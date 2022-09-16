//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require best_in_place

//= require jquery-ui
//= require best_in_place.jquery-ui
//= require sortable.min
//= require rails_sortable

$(function() {
    $('.sortable').railsSortable();
  });

  window.dispatchMapsEvent = function(...args) {
    const event = document.createEvent("Events")
    event.initEvent("google-maps-callback", true, true)
    event.args = args
    window.dispatchEvent(event)
  }