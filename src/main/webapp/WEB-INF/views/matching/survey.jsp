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
<title>나의 성향 설문조사</title>
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
	<div id="banner" class="banner">
		<div class="banner-image">
			<div class="backstretch">
				<img
					src="${pageContext.request.contextPath }/assets/images/bg-image-6.jpg">
			</div>
		</div>
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 object-non-visible"
						data-animation-effect="fadeIn">
						<p class="lead text-center">함께 동행할 SoulMate를 찾기 위한 절차입니다.</p>
						<h1 class="text-center" style="font-size: 50px">
							<span style="font-size: 75px; color: teal;">${authUser.usrNick}님</span>의
							<br>성향 조사를 시작하시겠습니까?
						</h1>
					</div>
					<div class="toggler">
					  <div id="effect" class="ui-widget-content ui-corner-all">
					    <h3 class="ui-widget-header ui-corner-all">Effect</h3>
					    <button id="button" class="ui-state-default ui-corner-all">Run Effect</button>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- banner end -->
	
	<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
	<!-- Jquery and Bootstap core js files -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- animation -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/survey-animation.js"></script>
		
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

	<!-- facebook  -->
	<script
		src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
</body>
</html>