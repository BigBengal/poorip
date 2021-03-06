<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip에 오신것을 환영합니다! - Party People</title>

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
<!-- matching css-->
<link href="${pageContext.request.contextPath}/assets/css/matching.css"
	rel="stylesheet">

<!--graph -->
<link rel="stylesheet"
	href="https://cdn3.devexpress.com/jslib/17.1.3/css/dx.spa.css" />
<link rel="stylesheet"
	href="https://cdn3.devexpress.com/jslib/17.1.3/css/dx.common.css" />
<link rel="stylesheet"
	href="https://cdn3.devexpress.com/jslib/17.1.3/css/dx.light.css" />

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Fugaz+One|Kaushan+Script|Pacifico"
	rel="stylesheet">

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
<script src="${pageContext.request.contextPath }/assets/js/matching.js"></script>

</head>
<body class="no-trans scroll-spy fix-header-on"
	style="background-color: #e8e6e6;">

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
							<span style="color: white; font-family: 'Pacifico';">PoOrip</span>
							<span style="color: #FFC6C3">과 함께 가요 </span>
						</h1>
						<p class="lead text-center">함께 즐기는 여행</p>
						<div class="arrow bounce">
							<a class="fa fa-arrow-down fa-2x" href="#contents"
								style="text-decoration: none;"></a>
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
				<h1 class="page-header"
					style="font-size: 2.5em; font-family: 'Nanum Pen Script', serif;">
					추천 결과 <small>Just For You</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->
		<!-- Project One -->
		<c:forEach var="matchingScore" items="${matchingScore }"
			varStatus="status">
			<div class="col-md-12 matchingList"
				id="personContainer-${matchingScore.usrSeq }"
				style="height: 540px; background-color: white;">

				<div class="col-md-2 col-xs-2"
					style="padding-top: 2%; padding-bottom: 10px; border-radius: 50%">
					<a> <img class="img-responsive"
						src="${matchingScore.usrProfile }" alt="${matchingScore.usrNick}"
						style="width: 70%; border-radius: 50%">
					</a>
					<div class="col-md-12 text-center"
						style="height: 30px; padding-bottom: 5px; margin-bottom: 15px; margin-top: 10%; padding-left: 0;">
						<c:choose>
							<c:when
								test="${matchingScore.usrNick == '' or matchingScore.usrNick == null}">
								<h1 style="font-size: 18px; font-family: 'Jeju Gothic', serif;">
									<span>사용자의 닉네임이 없습니다.</span>
								</h1>
							</c:when>
							<c:otherwise>
								<h3 style="font-size: 25px; height: 10px">
									<span
										style="font-family: 'Jeju Gothic', serif; color: #2f90a7;">'${matchingScore.usrNick}'</span>
								</h3>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-md-5 col-xs-10" style="padding-top: 20px;">
					<input type="hidden" id="usrSeq" name="usersSeq"
						value="${matchingScore.usrSeq }">
					<div>
						<h4 class="matching-font-style">자기소개</h4>
					</div>
					<div class="col-md-12 info"
						style="margin-bottom: 30px; border: solid 1px lightgrey; border-radius: 10px; padding: 7px;">
						<c:choose>
							<c:when
								test="${matchingScore.usrInfo == '' or matchingScore.usrInfo == null}">
								<p style="font-size: 15px; font-family: 'Nanum Gothic Coding'">${matchingScore.usrNick}님의
									소개가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<p class="span-font-family" style="word-break: break-all;">${matchingScore.usrInfo}</p>
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<h4 class="matching-font-style">HashTag</h4>
					</div>
					<div class="col-md-12 info"
						style="margin-bottom: 15px; margin-bottom: 30px; border: solid 1px lightgrey; border-radius: 10px; padding: 7px;">
						<c:choose>
							<c:when
								test="${matchingScore.usrHashtag == '' or matchingScore.usrHashtag == null}">
								<p style="font-size: 15px; font-family: 'Nanum Gothic Coding'">${matchingScore.usrNick}님의
									HashTag가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<p class="span-font-family">${matchingScore.usrHashtag}</p>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 					<hr> -->
					<div class="col-md-12 text-center samedatelist"
						onclick="showDateList(${matchingScore.usrSeq });"
						style="height: 20px; margin-bottom: 5%; ">
						<h2>
							<span class="menu_links span-font-family matching-trv-date">${matchingScore.usrNick}님의
								여행 일정 보기</span>
						</h2>
						<br>
					</div>
					<div class="col-md-12 date-list span-font-family"
						id="dateList-${matchingScore.usrSeq }"
						style="margin-bottom: 15px; text-align: center; border:dotted rgb(155, 212, 209);">
						<c:set var="dateListYN" value="N" />
						<c:forEach var="matchingDateList" items="${matchingDateList }">
							<c:if test="${matchingScore.usrSeq == matchingDateList.usrSeq }">
								<c:set var="dateListYN" value="Y" />
								<label
									style="font-family: 'sans-serif'; padding-left: 10px; padding-right: 10px; margin-bottom: 10px; margin-top: 10px;">${matchingDateList.ctyName }
									: ${matchingDateList.dateFrom } ~ ${matchingDateList.dateTo }</label>
								<br />
							</c:if>
						</c:forEach>
						<c:if test="${dateListYN == 'N'}">
							<label class="span-font-family" style="padding:10px;">여행 계획이 없는 사용자입니다.</label>
							<c:set var="dateListYN" value="Y" />
						</c:if>
					</div>
					<div class="col-md-12 text-center" style="margin-bottom: 15px;">
						<label>${matchingScore.usrNick}님과 ${userVo.usrNick }의 일정은
						</label> <br /> <label style="color: #339BEB;">${matchingScore.overlapDays }일</label>
						<label>동안 같습니다.</label>
					</div>
					<c:set var="isPoolMemberYN" value="N" />
					<c:forEach var="isPoolMember" items="${isPoolMember }">
						<c:if test="${isPoolMember.usrSeq == matchingScore.usrSeq}">
							<div class="col-md-12 matching-footer">
								<button class="btn made-a-pool-${matchingScore.usrSeq }"
									onclick="madePool(${matchingScore.usrSeq })"
									style="border-radius: 3px; font-family: 'Nanum Pen Script', serif;  font-size: 1.2em;
										">이미 풀이 존재함</button>
							</div>
							<c:set var="isPoolMemberYN" value="Y" />
						</c:if>
					</c:forEach>
					<c:if test="${isPoolMemberYN == 'N'}">
						<div class="col-md-12 matching-footer">
							<button
								class="btn btn-primary make-a-pool-${matchingScore.usrSeq }"
								onclick="makingPool(${matchingScore.usrSeq })"
								data-usrseq="${matchingScore.usrSeq }"
								style="border-radius: 3px; font-family: 'Nanum Pen Script', serif; font-size: 1.2em;">
								풀 파티 요청 <span class="glyphicon glyphicon-chevron-right"></span>
							</button>
						</div>
					</c:if>
				</div>

				<div class="col-md-5 col-xs-12 chart-div"
					data-usrseq="${matchingScore.usrSeq }"
					data-foodscore="${matchingScore.foodScore }"
					data-sightscore="${matchingScore.sightScore }"
					data-activityscore="${matchingScore.activityScore }"
					data-luxuryscore="${matchingScore.luxuryScore }"
					data-datescore="${matchingScore.dateScore }"
					data-userisurveyscore="${matchingScore.useriSurveyScore }"
					data-usrnick="${matchingScore.usrNick }"
					style="border-left: solid 1px lightgrey; margin-top: 30px">
					<div class="col-md-12 dx-viewport demo-container">
						<div id="chart-${matchingScore.usrSeq }" style="width: 100%"></div>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- /.row -->

		<!-- Page Content -->
		<div class="container">

			<!-- Introduction Row -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"
						style="font-family: 'Nanum Pen Script', serif; font-size: 1.8em;">
						${authUser.usrNick}님과 계획이 비슷한 여행자 <small>Have a good Time!</small>
					</h1>

					<br>
				</div>
			</div>

			<!-- Team Members Row -->
			<div class="row">
				<c:forEach var="samePlanMemeber" items="${samePlanMemeber }"
					varStatus="status">
					<div class="col-md-4 sameplanmember"
						style="min-height: 560px; margin-right: 20px; margin-bottom: 30px">
						<img class="img-circle img-responsive img-center"
							style="display: block; margin-left: auto; margin-right: auto; margin-bottom: 10px; padding-top: 10px;"
							src="${samePlanMemeber.usrProfile }" width="50px" 
							alt="${samePlanMemeber.usrNick}">
						<div class="col-md-12 text-center" style="margin: 5px">
							<h3 style="font-style: oblique;">
								<span>"${samePlanMemeber.usrNick}"</span>
							</h3>
						</div>
						<div class="col-md-12 info"
							style="margin-bottom: 10px; margin-left: 2.5%; width: 95%; border-radius: 8px; padding: 2%; border: solid 1px lightgrey; word-break: break-all;">
							<c:choose>
								<c:when
									test="${samePlanMemeber.usrInfo == '' or samePlanMemeber.usrInfo == null}">
									<p>${samePlanMemeber.usrNick}님의소개가없습니다.</p>
								</c:when>
								<c:otherwise>
									<p>${samePlanMemeber.usrInfo}</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-md-12 info"
							style="margin-bottom: 10px; margin-left: 2.5%; width: 95%; border-radius: 8px; padding: 2%; border: solid 1px lightgrey; word-break: break-all;">
							<c:choose>
								<c:when
									test="${samePlanMemeber.usrHashtag == '' or samePlanMemeber.usrHashtag == null}">
									<p>${samePlanMemeber.usrNick}님의해시태그가없습니다.</p>
								</c:when>
								<c:otherwise>
									<p>${samePlanMemeber.usrHashtag }</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-md-12 text-center samedatelist"
							onclick="showSameDateList(${samePlanMemeber.usrSeq });"
							style="margin-bottom: 10px; padding: 10px 30px 10px 30px;">
							<h2>
								<span
									class="menu_links span-font-family text-center matching-trv-date">${samePlanMemeber.usrNick}님의
									여행 일정 보기</span>
							</h2>
						</div>
						<div class="col-md-12 block-date-list"
							id="showDateList-${samePlanMemeber.usrSeq }"
							style="margin-bottom: 10px; text-align:center; overflow:auto;">
							<c:forEach var="samePlanDateList" items="${samePlanDateList }">
								<c:if
									test="${samePlanMemeber.usrSeq == samePlanDateList.usrSeq }">
									<label>${samePlanDateList.ctyName } :
										${samePlanDateList.dateFrom } ~ ${samePlanDateList.dateTo }</label>
									<br />
								</c:if>
							</c:forEach>
							<br>
						</div>
						<div class="col-md-12 span-font-family text-center" style="position: absolute;
    bottom: 10%;">
							${samePlanMemeber.usrNick}님과 ${userVo.usrNick }의 일정은 <br /> <label
								style="color: #339BEB;">${samePlanMemeber.overlapDays }일</label>
							동안 같습니다.
						</div>
						<c:set var="isPoolMemberYN" value="N" />
						<c:forEach var="isPoolMember" items="${isPoolMember }">
							<c:if test="${isPoolMember.usrSeq == samePlanMemeber.usrSeq}">
								<div class="col-md-12" id="same-plan-footer">
									<button class="btn made-a-pool-${samePlanMemeber.usrSeq }"
										onclick="madePool(${samePlanMemeber.usrSeq })" style="font-family: 'Nanum Pen Script', serif;  font-size: 1.2em;
										">
										이미 풀이 존재함</button>
								</div>
								<c:set var="isPoolMemberYN" value="Y" />
							</c:if>
						</c:forEach>
						<c:if test="${isPoolMemberYN == 'N'}">
							<div class="col-md-12" id="same-plan-footer">
								<button
									class="btn btn-primary make-a-pool-${samePlanMemeber.usrSeq }"
									onclick="makingPool(${samePlanMemeber.usrSeq })"
									data-usrseq="${samePlanMemeber.usrSeq }" style="font-family: 'Nanum Pen Script', serif; font-size: 1.2em;">
									풀 파티 요청<span class="glyphicon glyphicon-chevron-right"></span>
								</button>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- footer start -->
	<!-- ================ -->
	<footer id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</footer>
	<!-- footer end -->

	<!-- 풀 만들기 다이얼로그 -->
	<c:forEach var="matchingScore" items="${matchingScore }"
		varStatus="status">
		<form id="making-pool-form-${matchingScore.usrSeq }"
			action="${pageContext.request.contextPath}/poolparty/make"
			data-usrseq="${matchingScore.usrSeq }" method="post">
			<input type="hidden" value="${matchingScore.usrSeq }" name="usrSeq">
			<div id="making-pool-${matchingScore.usrSeq }" title="풀 파티 요청"
				style="display: none">
				<p>
					<span style="float: left; margin: 12px 12px 20px 0;"></span>${matchingScore.usrNick }님과의
					풀 생성을 요청 하시겠습니까?
				</p>
			</div>
		</form>
	</c:forEach>
	
	<c:forEach var="samePlanMemeber" items="${samePlanMemeber }"
		varStatus="status">
		<form id="making-pool-form-${samePlanMemeber.usrSeq }"
			action="${pageContext.request.contextPath}/poolparty/make"
			data-usrseq="${samePlanMemeber.usrSeq }" method="post">
			<input type="hidden" value="${samePlanMemeber.usrSeq }" name="usrSeq">
			<div id="making-pool-${samePlanMemeber.usrSeq }" title="풀 파티 요청"
				style="display: none">
				<p>
					<span style="float: left; margin: 12px 12px 20px 0;"></span>${samePlanMemeber.usrNick }님과의
					풀 생성을 요청 하시겠습니까?
				</p>
			</div>
		</form>
	</c:forEach>

	<!-- 존재 하는 풀 다이얼로그 -->
	<c:forEach var="matchingScore" items="${matchingScore }"
		varStatus="status">
		<input type="hidden" value="${matchingScore.usrSeq }" name="usrSeq">
		<div id="made-pool-${matchingScore.usrSeq }"
			title="이미 같은 풀" style="display: none">
			<p>
				<span class="ui-icon ui-icon-alert"
					style="float: left; margin: 12px 12px 20px 0;"></span>${matchingScore.usrNick }님과의
				풀이 이미 생성되어 있습니다.
			</p>
		</div>
	</c:forEach>
	
	<c:forEach var="samePlanMemeber" items="${samePlanMemeber }"
		varStatus="status">
		<input type="hidden" value="${samePlanMemeber.usrSeq }" name="usrSeq">
		<div id="made-pool-${samePlanMemeber.usrSeq }"
			title="이미 같은 풀" style="display: none">
			<p>
				<span class="ui-icon ui-icon-alert"
					style="float: left; margin: 12px 12px 20px 0;"></span>${samePlanMemeber.usrNick }님과의
				풀이 이미 생성되어 있습니다.
			</p>
		</div>
	</c:forEach>

</body>
</html>