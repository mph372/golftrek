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


      let autocomplete;
      function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
          document.getElementById('autocomplete'),
          {
            types: ['establishment'],
            componentRestrictions: {'country': ['US']},
            fields: ['place_id', 'geometry', 'name']
          }
        );
        autocomplete.addListener('place_changed', onPlaceChanged);
      }

      function onPlacedChanged() {
        
      }
     
