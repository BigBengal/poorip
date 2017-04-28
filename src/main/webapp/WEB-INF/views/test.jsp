<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
<link href="path/to/lightbox.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"> </script>
<script src="path/to/lightbox.js"></script>     
</head>
<body>

<div class="w3-container">
  <h2>W3.CSS Modal Image</h2>
  <p>Click on the image to display it in full size:</p>

  <img src="${pageContext.request.contextPath }/assets/images/mySNS.jpg" style="width:30%;cursor:zoom-in"
  onclick="document.getElementById('modal01').style.display='block'">

  <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
    <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
    <div class="w3-modal-content w3-animate-zoom">
      <img src="${pageContext.request.contextPath }/assets/images/mySNS.jpg" data-lightbox="img" style="width:100%">
      <img src="${pageContext.request.contextPath }/assets/images/mySNS.jpg" data-lightbox="img"  style="width:100%">
    </div>
  </div>
</div>
       
</body>
</html>