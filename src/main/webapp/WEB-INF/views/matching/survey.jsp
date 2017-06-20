<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성향조사설문</title>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/poorip/assets/bootstrap/css/bootstrap-datepicker.min.css" />
<!-- Web Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300'
	rel='stylesheet' type='text/css'>
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
<!-- Bootstrap toggle -->
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="/poorip/assets/bootstrap/js/moment.js"></script>
<script src="/poorip/assets/bootstrap/js/transition.js"></script>
<script src="/poorip/assets/bootstrap/js/collapse.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>
<!-- Modernizr javascript -->
<script
	src="${pageContext.request.contextPath }/assets/plugins/modernizr.js"></script>
<!-- Isotope javascript -->
<script
	src="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.pkgd.min.js"></script>
<!-- Backstretch javascript -->
<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.backstretch.min.js"></script>
<!-- Appear javascript -->
<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.appear.js"></script>
<!-- Initialization of Plugins -->
<%-- <script src="${pageContext.request.contextPath }/assets/js/template.js"></script>  --%>
<!-- Custom Scripts -->
<script src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
<!-- facebook  -->
<script
	src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
<!-- Vaildation-->
<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.validate.min.js"></script>
<!-- Bootstrap toggle -->
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
	$(document).ready(function() {

		// MyMenu 고정
		if (($(".dropdown-content").length > 0)) {
			// My메뉴 위치 구하기
			var $myMenu = $("#myMenu");
			var myMenuPos = $myMenu.offset().top;
		}

		// myMenu 보기
		$("#MyMenuHover").mouseenter(function() {
			$myMenu.addClass("show");
		});
		$("#myMenu").mouseleave(function() {
			$myMenu.removeClass("show");
		});

		// Fixed header
		//-----------------------------------------------
		$(window).scroll(function() {
			if (($(".header.fixed").length > 0)) {
				if (($(this).scrollTop() > 0) && ($(window).width() > 767)) {
					$("body").addClass("fixed-header-on");
				} else {
					$("body").removeClass("fixed-header-on");
				}
			}
			;
			//myMenu 고정
			if (($(".dropdown-content").length > 0)) {
				// 스크롤 위치 값 구하기
				var scrollY = window.pageYOffset;
				// 스크롤 위치 값이 탭메뉴 위치 보다 큰 경우만 탭메뉴에 fixed 클래스 적용. 그렇지 않은 경우 fixed 클래스 제거
				if (scrollY > myMenuPos) {
					$myMenu.addClass("fixed");
				} else {
					$myMenu.removeClass("fixed");
				}
			}
		});
		$.backstretch("/poorip/assets/images/bg-image-6.jpg");
	});
</script>
<head>
	<style>
		.nextButton {
		    position: relative;
		    top: 1px;
		    display: inline-block;
		    font-family: 'Glyphicons Halflings';
		    font-style: normal;
		    font-weight: 400;
		    font-size: 60px;
		    line-height: 1;
		    -webkit-font-smoothing: antialiased;
		    -moz-osx-font-smoothing: grayscale;
	        width: 100px;
		    display: inline-block;
		    float: left;
		    background: transparent;
		    border: 0;
		}
	</style>
</head>
<body class="no-trans">
	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

	<!-- banner start -->
	<!-- ================ -->
	<div id="banner" class="banner">
		<div class="banner-image">
			<div class="backstretch" style="background: #8ca7b5"></div>
		</div>
	</div>
	<!-- banner end -->

	<div class="banner-caption">
		<div class="container" style="font-family: 'Noto Sans KR', sans-serif;">
			<div class="row">
				<p class="lead text-center" style="color: white;">함께 동행할 멤버를 찾기 위한 절차입니다.</p>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-md-8 col-md-offset-2"
						data-animation-effect="fadeIn">
						<h1 class="text-center" style="font-size: 50px">
							<span style="font-size: 75px; color: teal;">${authUser.usrNick}님</span>의
							<br>성향 조사를 시작하시겠습니까? <br>(총 5문제)
						</h1>
						<p class="lead text-center" style="color: white; font-size: 16px">※스크랩한 여행지가 없을시 계획이 비슷한 여행자와 매칭됩니다.</p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-8 col-md-offset-2"
						data-animation-effect="fadeIn">
						<div class="form-group">
							<p class="col-md-4">
								<a href="${pageContext.request.contextPath }/">
									<button class="nextButton glyphicon-repeat menu_links" style="width: 80px; display: inline-block; float: left; margin-top: 10px;"></button>
								</a>
							</p>
							<p class="col-md-4"></p>
							
							<form action="${pageContext.request.contextPath }/matching/surveyQ" method="post">
							<input type="submit" style="display:none;" id="go-to-survey" >
							<label for="go-to-survey" style="width: 80px; display: inline-block; float: right;"><button class="nextButton glyphicon-menu-right menu_links" style="width: 80px; display: inline-block; float: right; color: #55acee;"></button></label>
							
								
								</form>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>