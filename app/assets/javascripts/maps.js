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

  $(document).ready(function() {
    initialize();
  });
