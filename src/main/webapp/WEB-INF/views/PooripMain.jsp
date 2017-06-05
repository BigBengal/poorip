<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="google-signin-client_id" content="124530211520-gtfp80s234icq65e85pn302nhlmpulku.apps.googleusercontent.com">
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
<link href="${pageContext.request.contextPath}/assets/css/lightbox.css"
	rel="stylesheet">
	<!--  Sweet Alert -->
<link href="${pageContext.request.contextPath }/assets/css/sweetalert.css"
	rel="stylesheet">

<!-- 스위트 알람 -->
<link href="${pageContext.request.contextPath }/assets/css/sweetalert.css"
	rel="stylesheet">
	
<!-- Google font -->	
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Kaushan+Script|Pacifico" rel="stylesheet">

<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>

<body class="no-trans">
<!-- 구글 analytics 코드 -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-99030302-1', 'auto');
  ga('send', 'pageview');

</script>
	
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
	<div id="banner" class="banner">
		<div class="banner-image">
			<div class="backstretch">
				<img
					src="${pageContext.request.contextPath }/assets/images/pool-party2.jpg">
			</div>
		</div>
		<div class="banner-caption">
			<div class="container">
				<c:import url="/WEB-INF/views/include/banner.jsp" />
			</div>
		</div>
	
	</div>
	
	<!-- banner end -->


	<!-- travel-Info start -->
	<!-- ================ -->
	<div class="section">
		<div class="container">
			<c:import url="/WEB-INF/views/include/travelInfo.jsp" />
		</div>
	</div>
	<!-- travel-Info end -->
	<!-- member start -->
	<!-- ================ -->

	<!-- member end -->

	<!-- finder start -->
	<!-- ================ -->

	<!-- finder end -->

	<!-- footer start -->
	<!-- ================ -->
	<footer id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</footer>
	<div id="loginfail">${login}</div>
	<!-- footer end -->
	
	<div class="se-pre-con" ></div>

	<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
	<!-- Jquery and Bootstap core js files -->
<!-- 	<script type="text/javascript" -->
<%-- 		src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script> --%>
			<!-- date picker -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
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
	 <!--  Sweet Alert -->
<script src="${pageContext.request.contextPath }/assets/js/sweetalert.min.js"></script>
	<!-- Custom Scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
	
	<!-- Ajax 파일 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/ajax.js"></script>
		
	<!-- Light Box -->
	<script src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>
	<!-- facebook  -->
	<script
		src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
	<!-- sweet alert -->
	<script
		src="${pageContext.request.contextPath }/assets/js/sweetalert.min.js"></script>
		
	<!-- Gallera image slider -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/galleria/1.5.7/galleria.min.js"></script>
    
	<!--  Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdfn7ld2w_RvKQbflObkV6r5ClLuqqUp4&callback=initMap"
    async defer></script>
	<script>
		$(function() {
			
			// 첫페이지만 footer 보여주기
			$(".footer.section").removeClass("object_hide");
			
			var dateFormat = "mm/dd/yy", from = $("#from").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 2
			}).on("change", function() {
				to.datepicker("option", "minDate", getDate(this));
			}), to = $("#to").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 2
			}).on("change", function() {
				from.datepicker("option", "maxDate", getDate(this));
			});

			function getDate(element) {
				var date;
				try {
					date = $.datepicker.parseDate(dateFormat, element.value);
				} catch (error) {
					date = null;
				}

				return date;
			}
			
			$('.modal').on('shown.bs.modal', function () {
				var tagId = $(this).attr('id');

				if(tagId.substring(8,9)!=1)
					showMap(tagId);
			});
				
			$(document).on("click","#citygo",function(){
				var ctyseq = $(this).data("ctyseq");
				console.log(ctyseq);
				location.href="/poorip/city/"+ctyseq+"#portfolio";
			});
			
			
			//인기 TOP 12 도시 이름 더 보기 버튼
			$("#citymore").on('click', function(){
				$(this).remove();
				$("#citylist div").each(function(index){
					if($(this).is(".object_hide"))	{
						$(this).removeClass("object_hide")
					}
				});
			});
			
			var login = $("#loginfail").text().substring(0,4);
// 			console.log("login:"+login);
			if ( login == "fail"){
				swal({
				  title: '',
				  type: 'info',
				  text: 'Facebook 로그인 해주세요',
// 				  html: '<p>상단 Facebook 버튼으로 <br>로그인해 주세요<p>',
				  width: '150px',
				  padding: 100,
				  background: '#fff',
				  timer: 2000
				});
			}

		});
		
		
		function initMap() {
			return 0
		      }
		
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
// 		    console.log("url:"+url);
		    
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

	<%-- <c:forEach items="${sessionScope}" var="attr">
    ${attr.key}=${attr.value}<br>
	</c:forEach> --%>
</body>
</html>