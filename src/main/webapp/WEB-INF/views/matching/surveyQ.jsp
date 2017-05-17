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
	});
	
	
	
	jQuery(function(){
        jQuery('#showall').click(function(){
              jQuery('.targetDiv').show();
       });
       jQuery('.showSingle').click(function(){
             jQuery('.targetDiv').hide();
             jQuery('#div'+$(this).attr('target')).show();
       });
       
       $('#survey-submit').click(function(){
   		console.log("Dddd");
   		$('#survey-form').submit();
   	});
});
	
	
</script>