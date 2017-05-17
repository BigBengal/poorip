<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip에 오신것을 환영합니다!</title>
<meta name="description"
	content="Worthy a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Date Picker -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Web Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- Font Awesome CSS -->
<link
	href="${pageContext.request.contextPath}/assets/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- Plugins -->
<link
	href="${pageContext.request.contextPath}/assets/css/animations.css"
	rel="stylesheet">
<!-- Worthy core CSS file -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">


<!-- Custom css -->
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">

<!-- Date Picker css -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   		<link rel="stylesheet" href="/resources/demos/style.css"> -->


<!-- Reviews -->
<link href="${pageContext.request.contextPath}/assets/css/lightbox.css" rel="stylesheet">
</head>


<body class="no-trans">
	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

	<!-- header start -->
	<!-- ================ -->
	<header class="header fixed clearfix navbar navbar-fixed-top">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
	</header>
	<!-- header end -->

	<!-- banner start -->
	<!-- ================ -->
	<div id="banner" class="banner-addinfo">
		<div class="banner-image banner-image-common">
			<div class="backstretch mypage-backstretch" style="position:relative;">
				<img
					src="${pageContext.request.contextPath }/assets/images/greece-santorini.jpg">
			</div>
		</div>
		<div class="banner-caption">
			<div class="container">
				<c:import url="/WEB-INF/views/scrap/scrapBanner.jsp" />
			</div>
		</div>
	</div>
	
	
	<!-- banner end -->
	<div class="section" style="padding-bottom: 400px">
		<div class="container">
		
			<div id="testmap" class="googlemap"></div>
			<c:import url="/WEB-INF/views/scrap/scrapInfo.jsp" />
		</div>
	</div>


	<!-- member start -->
	<!-- ================ -->
<!-- 	<div class="section translucent-bg bg-image-2 pb-clear"> -->
<%-- 		<c:import url="/WEB-INF/views/include/member.jsp" /> --%>
<!-- 	</div>  -->
	<!-- member end -->

	<!-- finder start -->
	<!-- ================ -->
	<%-- <div class="default-bg space">
		<div class="container">
			<c:import url="/WEB-INF/views/include/finder.jsp" />
		</div>
	</div> --%>
	<!-- finder end -->

	<!-- footer start -->
	<!-- ================ -->
<!-- 	<footer id="footer"> -->
<%-- 		<c:import url="/WEB-INF/views/include/footer.jsp" /> --%>
<!-- 	</footer> -->
	<ol id="poollist">
	</ol>
	<!-- footer end -->

	<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
	
	
	<!-- Jquery and Bootstap core js files -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- Modernizr javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/modernizr.js"></script>

	<!-- Isotope javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.pkgd.min.js"></script>

	<!-- Backstretch javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery.backstretch.min.js"></script>

	<!-- Appear javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery.appear.js"></script>

	<!-- Initialization of Plugins -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/template.js"></script>

	
	<!-- Light Box -->
	<script src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>
	<!-- date picker -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- facebook  -->
	<script src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
	<c:import url="/WEB-INF/views/include/ajax.jsp" />
	<!-- Custom Scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
	
	
<%-- <c:forEach items="${sessionScope}" var="attr"> --%>
<%--     ${attr.key}=${attr.value}<br> --%>
<%-- </c:forEach> --%>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdfn7ld2w_RvKQbflObkV6r5ClLuqqUp4&callback=initMap">
    </script>
<script>
$(document).ready(function(){
	$(".nav-pills > li").eq(0).addClass("active");
	
	$('.modal').on('shown.bs.modal', function () {
		console.log("ss");	
// 		showMap(tagId);
	});
	
	
});

function initMap() {
	var bounds = new google.maps.LatLngBounds();
    var map = new google.maps.Map(document.getElementById('testmap'), {
         zoom: 15,
         center: {lat: 1.88934575, lng: 2.4879015},
         mapTypeId: 'terrain'
    });

    var tourDirection = [
    	{lat: 41.889886, lng:12.492031},
   		{lat: 41.889778, lng:12.490612},
   		{lat: 41.889517, lng:12.487460},
		{lat: 41.888202, lng:12.481503}
        ];
        
	var flightPath = new google.maps.Polyline({
          path: tourDirection,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });
        
        
	var beaches = [
        	['진실의 입',41.889886, 12.492031,1,'aaaaa'],
       		['콜로세움',41.889778, 12.490612,2,'bbbbb'],
   			['우쭈쭈',41.889517, 12.487460,3,'cccccc'],
			['잘 되면 대박',41.888202, 12.481503,4,'ddddddd']
        	];
//  var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';

        
	// Add multiple markers to map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
	// Place each marker on the map  
    for( i = 0; i < beaches.length; i++ ) {
    	var beach = beaches[i];
        var position = new google.maps.LatLng(beach[1], beach[2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
        	position: position,
    		map: map,
// 	        icon: image,
// 	        shape: shape,
    		nimation: google.maps.Animation.DROP,
//     	    icon: image,
    		label: beach[0],
    		title: beach[0],
    		zIndex: beach[3],
    		info:beach[4]
        });
        
        // Add info window to marker    
        google.maps.event.addListener(marker, 'click', (function(marker) {
            return function() {
                infoWindow.setContent(marker.info);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Center the map to fit all markers on the screen
        map.fitBounds(bounds);
    }

    // Set zoom level
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(14);
        google.maps.event.removeListener(boundsListener);
    });   
    
        

//         setMarkers(map);
    flightPath.setMap(map);
};

function showMap(seq) {
    var mapId = "map-"+seq;
    var url = $('#'+mapId).data("url");
    if (url == ""){
    	$('#'+mapId).removeClass("googlemap");
    	$('#'+mapId).text("정보없음");
    	return;
    }
    var locArray = url.split(",");
    var myLatlng = new google.maps.LatLng($.trim(locArray[0]),$.trim(locArray[1]));
//	    console.log("url:"+url);
    
    var mapOptions = {
      zoom: 15,
      center: myLatlng
    }
    var map = new google.maps.Map(document.getElementById(mapId), mapOptions);

    var marker = new google.maps.Marker({
        position: myLatlng,
        title:"Poorip!!"
    });
    
	// To add the marker to the map, call setMap();
    marker.setMap(map);

}
</script>
</body>
</html>