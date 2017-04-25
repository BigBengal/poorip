<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip에 오신것을 환영합니다!</title>
<meta name="description"
	content="Worthy a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

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

<!-- Reviews -->
<link href="${pageContext.request.contextPath}/assets/css/lightbox.css"
	rel="stylesheet">


<!-- SNS CSS -->
<style type="text/css">
	th, td {
		padding: 5px;
	}
	
	table {
		border-spacing: 5px;
		width: 100%;
		border: 1px solid #bcbcbc;
	}
</style>
</head>

<body class="no-trans scroll-spy">
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
		<div class="banner-image-sns">
			<div class="backstretch">
				<img
					src="${pageContext.request.contextPath }/assets/images/mySNS.jpg">
			</div>
		</div>
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 object-non-visible"
						data-animation-effect="fadeIn">
						<h1 class="text-center">
							혜영's <span>Travel Story</span>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- banner end -->

	<!-- mySNS start -->
	<!-- ================ -->
	<div id="mySNS" class="mySNS">
		<c:import url="/WEB-INF/views/sns/mySNS.jsp" />
	</div>
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

	<!-- Custom Scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
	<!-- Light Box -->
	<script src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>
	<!-- date picker -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- facebook  -->
	<script src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
	<c:import url="/WEB-INF/views/sns/sns-ajax.jsp" />
	<script>
		$(function() {
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
		});

	</script>

</body>
</html>