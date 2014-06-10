  function initialize() {

    if (navigator.geolocation)
    {
      navigator.geolocation.getCurrentPosition(function (position) {
          alert(position.coords.latitude + ',' + position.coords.longitude);
      }, function (error) {
          alert(error.code);
      }, {enableHighAccuracy: true, maximumAge: 0});
      navigator.geolocation.getCurrentPosition(showPosition);
    } else{
      $('.alert').innerHTML = "Geolocation is not supported by this browser.";
    }
  }
  
  function showPosition(position) {
    $('#lat').val(position.coords.latitude);
    $('#lng').val(position.coords.longitude);
  }

  $(document).ready(function() {
    initialize();
  });
