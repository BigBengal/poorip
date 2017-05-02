<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width:500px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
    
    function initMap() {
      var myLatlng = new google.maps.LatLng(48.858450, 2.294494);
      
      var mapOptions = {
        zoom: 15,
        center: myLatlng
      }
      var map = new google.maps.Map(document.getElementById("map"), mapOptions);

      var marker = new google.maps.Marker({
          position: myLatlng,
          title:"Poorip!!"
      });
      
	// To add the marker to the map, call setMap();
      marker.setMap(map);

      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdfn7ld2w_RvKQbflObkV6r5ClLuqqUp4&callback=initMap"
    async defer></script>
  </body>
</html>