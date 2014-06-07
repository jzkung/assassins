  // var map = null;

  function initialize() {
    // map = new google.maps.Map(document.getElementById('map-canvas'), {
    //   mapTypeId: google.maps.MapTypeId.ROADMAP
    // });

    // bound1_lat = "37.437445";
    // bound1_lng = "-122.170341";
    // bound2_lat = "37.425449";
    // bound2_lng = "-122.162273";

    // var defaultBounds = new google.maps.LatLngBounds(
    //   new google.maps.LatLng(bound1_lat, bound1_lng),
    //   new google.maps.LatLng(bound2_lat, bound2_lng));
    // map.fitBounds(defaultBounds);

    // $('#map-bound1-lat').val(bound1_lat);
    // $('#map-bound1-lng').val(bound1_lng);
    // $('#map-bound2-lat').val(bound2_lat);
    // $('#map-bound2-lng').val(bound2_lng);

    if (navigator.geolocation)
    {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else{
      $('.alert').innerHTML = "Geolocation is not supported by this browser.";
    }
  }
  
  function showPosition(position) {
    $('#lat').val(position.coords.latitude);
    $('#lng').val(position.coords.longitude);
  }

  // function addReminderMarkers(map) {
  //   $('.entry').each(function(i, el) {
  //     var name = $(this).children('.name').text();
  //     var latitude = $(this).children('.latitude').text();
  //     var longitude = $(this).children('.longitude').text();

  //     var latLng = new google.maps.LatLng(latitude, longitude);

  //     var marker = placeMarker(name, latLng, map);
  //     reminders[i] = marker;
  //   });
  // }

  // $('#add-nearby-reminder').click(function() {
  //   $("#nearby-reminder-id").val(id);
  //   var name = $('#nearby-reminder-name').val();
  //   $("#sent-nearby-reminder-name").val(name);
  //   var lat = $('#nearby-reminder-lat').val();
  //   var lng = $('#nearby-reminder-lng').val();

  //   var deleteButton = $('<button>').addClass('delete_button').text('Delete').attr('data-id', id);
  //   deleteButton.click(removeRem);

  //   $('#reminders tbody').append(
  //     $('<tr>').append($('<td class="name">').text(name))
  //              .append($('<td class="latitude">').text(lat))
  //              .append($('<td class="longitude">').text(lng))
  //              .append($('<td class="delete">').append(deleteButton))
  //     );

  //   mostRecentMarker.setMap(null);
  //   $('#nearby-reminder-name').val('');
  //   var marker = placeMarker(name, new google.maps.LatLng(lat, lng), map);
  //   reminders[id++] = marker;
  // });

  $(document).ready(function() {
    initialize();
  });
