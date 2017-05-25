<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<div class="se-pre-con">Loading...</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>soulMate</title>

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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/poorip/assets/bootstrap/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
<!-- 하단 화살표 -->
<link href="${pageContext.request.contextPath}/assets/css/matching.css"
	rel="stylesheet">
<!--graph -->
<!-- <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.2.504/styles/kendo.common-fiori.min.css" /> -->
<!-- <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.2.504/styles/kendo.fiori.min.css" /> -->
<!-- <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.2.504/styles/kendo.fiori.mobile.min.css" /> -->
<link rel="stylesheet"
	href="https://cdn3.devexpress.com/jslib/17.1.3/css/dx.spa.css" />
<link rel="stylesheet"
	href="https://cdn3.devexpress.com/jslib/17.1.3/css/dx.common.css" />
<link rel="stylesheet"
	href="https://cdn3.devexpress.com/jslib/17.1.3/css/dx.light.css" />
	<!-- Google font -->	
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Kaushan+Script|Pacifico" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/moment.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/transition.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/collapse.js"></script> -->

<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--graph -->
<!-- <script src="https://kendo.cdn.telerik.com/2017.2.504/js/kendo.all.min.js"></script> -->
<script src="https://cdn3.devexpress.com/jslib/17.1.3/js/dx.all.js"></script>

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

<!-- 상단 메뉴 및 기본 -->
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<!-- facebook  -->
<script
	src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
<!-- Vaildation-->
<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.validate.min.js"></script>
<!-- chart -->
<script
	src="${pageContext.request.contextPath }/assets/js/matching.js"></script>

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
	<div id="banner" class="banner">
		<div class="banner-image">
			<div class="backstretch"
				style="z-index: -999998; position: absolute; width: 100%; height: 100%;">
			</div>
		</div>
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 object-non-visible"
						data-animation-effect="fadeIn">
						<h1 class="text-center">
							<span style="font-family: 'Pacifico', cursive; color:white;">PoOrip</span> <span style="color: #FFC6C3">과 함께 가요 </span>
						</h1>
						<p class="lead text-center" >함께 즐기는 여행</p>
						<div class="arrow bounce">
							<a class="fa fa-arrow-down fa-2x" href="#contents"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" id="contents">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					추천 결과 <small>Bless You</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->
		<!-- Project One -->
		<c:forEach var="matchingScore" items="${matchingScore }"
			varStatus="status">
			<div class="row">
				<div class="col-md-3" >
					<a href="#"> <img class="img-responsive"
						src="${matchingScore.usrProfile }" alt="${matchingScore.usrNick}"
						style="width: 80%">
					</a>
				</div>
				<div class="col-md-5">
					<input type="hidden" id="usrSeq" value="${matchingScore.usrSeq }">
					<h3>${matchingScore.usrNick}</h3>
					<h4>Subheading</h4>
					<p>${matchingScore.usrInfo}</p>
					<%-- 					<p>${matchingScore.usrHashtag}</p> --%>
					<a class="btn btn-primary" href="#" onclick="makePool()">make
						a pool <span class="glyphicon glyphicon-chevron-right"></span>
						</a>
				</div>
				<div class="col-md-4 chart-div" data-usrseq="${matchingScore.usrSeq }" data-foodscore="${matchingScore.foodScore }"
							data-sightscore="${matchingScore.sightScore }" data-activityscore="${matchingScore.activityScore }"
							data-luxuryscore="${matchingScore.luxuryScore }" data-datescore="${matchingScore.dateScore }"
							data-userisurveyscore="${matchingScore.useriSurveyScore }">
					<div class="col-md-12 dx-viewport demo-container" style="height: 245px; top: -87px">
						<div id="chart-${matchingScore.usrSeq }" style="width: 100%"></div>
					</div>
				</div>
			</div>
			<hr>
		</c:forEach>
		<!-- /.row -->

		<!-- Page Content -->
		<div class="container">

			<!-- Introduction Row -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						${authUser.usrNick}님과 계획이 비슷한 여행자 <small>Have a good Time!</small>
					</h1>
					<p>${authUser.usrNick}님께서관광할여행지가비슷한여행자들입니다.즐거운여행이되시길...</p>
				</div>
			</div>

			<!-- Team Members Row -->
			<div class="row">
				<c:forEach var="samePlanMemeber" items="${samePlanMemeber }"
					varStatus="status">
					<div class="col-lg-4 col-sm-6 text-center">
						<img class="img-circle img-responsive img-center"
							src="${samePlanMemeber.usrProfile }"
							alt="${samePlanMemeber.usrNick}">
						<h3>
							${samePlanMemeber.usrNick} <small>Job Title</small>
						</h3>
						<p>${samePlanMemeber.usrInfo}</p>
						<a class="btn btn-primary" href="#">make a pool <span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- footer start -->
	<!-- ================ -->
	<footer id="footer">
		<div class="subfooter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<p class="text-center">
							Copyright © 2017 Created by <a target="_blank"
								href="https://github.com/BigBengal/poorip">BigBengal</a>.
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer end -->
</body>
</html>