<!DOCTYPE html>
<html>
  <head>
    <style>
      #map {
        height: 400px;
        width: 100%;
       }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/map.js"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgCFe9BgFDA2zVfQdTeLPIDqLiXvBNUhs&callback=initMap">
    </script>
  </body>
</html>