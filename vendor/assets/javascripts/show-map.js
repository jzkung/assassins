var map = null;

function initialize() {

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

function initialize2() {
  map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  bound1_lat = "37.437445";
  bound1_lng = "-122.170341";
  bound2_lat = "37.425449";
  bound2_lng = "-122.162273";

  var defaultBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(bound1_lat, bound1_lng),
    new google.maps.LatLng(bound2_lat, bound2_lng));
  map.fitBounds(defaultBounds);

  $('#map-bound1-lat').val(bound1_lat);
  $('#map-bound1-lng').val(bound1_lng);
  $('#map-bound2-lat').val(bound2_lat);
  $('#map-bound2-lng').val(bound2_lng);

  addReminderMarkers(map);
}

function placeMarker(title, location, map) {
  var marker = new google.maps.Marker({
      position: location,
      map: map
  });
  var infowindow = new google.maps.InfoWindow();

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(title);
    infowindow.open(map, this);
  });

}

function addReminderMarkers(map) {
  $('.marker').each(function(i, el) {
    var latitude = $(this).children('.lat').text();
    var longitude = $(this).children('.lng').text();
    var assassin = $(this).children('.assassin').text();
    var target = $(this).children('.target').text();
    var game = $(this).children('.game').text();
    var title = "Game: " + game + ", " + target + " killed by " + assassin;

    var latLng = new google.maps.LatLng(latitude, longitude);
    placeMarker(title, latLng, map);
  });
}

$(document).ready(function() {
  initialize();
  initialize2();
});
