<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>풀 파티</title>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">	
<link rel="stylesheet" href="/poorip/assets/bootstrap/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Web Fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300'
	rel='stylesheet' type='text/css'>
<!-- Font Awesome CSS -->
<link href="${pageContext.request.contextPath}/assets/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<!-- Plugins -->
<link href="${pageContext.request.contextPath}/assets/css/animations.css"
	rel="stylesheet">
<!-- Worthy core CSS file -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<!-- Custom css -->
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- <script src="/poorip/assets/bootstrap/js/moment.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/transition.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/collapse.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Modernizr javascript -->
<script src="${pageContext.request.contextPath }/assets/plugins/modernizr.js"></script>
<!-- Isotope javascript -->
<script src="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.pkgd.min.js"></script>
<!-- Backstretch javascript -->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.backstretch.min.js"></script>
<!-- Appear javascript -->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.appear.js"></script>
<!-- Initialization of Plugins -->
<%-- <script src="${pageContext.request.contextPath }/assets/js/template.js"></script>  --%>
<!-- Custom Scripts -->
<script src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
<!-- facebook  -->
<script src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
<!-- Vaildation-->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
	
	// Animations
	//-----------------------------------------------
	if (($("[data-animation-effect]").length>0) && !Modernizr.touch) {
		$("[data-animation-effect]").each(function() {
			var $this = $(this),
			animationEffect = $this.attr("data-animation-effect");
			if(Modernizr.mq('only all and (min-width: 768px)') && Modernizr.csstransitions) {
				$this.appear(function() {
					setTimeout(function() {
						$this.addClass('animated object-visible ' + animationEffect);
					}, 400);
				}, {accX: 0, accY: -130});
			} else {
				$this.addClass('object-visible');
			}
		});
	};

});
</script>

</head>
<body>
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
<div style="height: 200px;">
</div>

<div class="col-md-10">
	<div class="col-md-4">
		<img src="${pool.poolPic}">
	</div>
	<div class="col-md-8">
		<div class="col-md-10">
		<h1>${pool.poolName} </h1>
		</div>
		<div class="col-md-2">
		<img src="/poorip/assets/images/gear.png" width="30px">
		<c:if test="${authUser == null }">
			가입요청
		</c:if>
		</div>
	<div class="col-md-12">
	<h3>${pool.poolComment} </h3>
	<p> 관리자 : <img src="${pool.managerProfile}"> ${pool.managerUsrNick } </p>
	
	<h5>
	<c:if test="${pool.fromDate != null or pool.toDate != null}">
	 여행 기간 : ${pool.fromDate} ~ ${pool.toDate} 
	</c:if>
	
	
	</h5>
	</div>
	</div>
	
	${ poolpost }
	
</div>

<div class="col-md-2 hidden-xs">
풀파티 맴버
<%-- 	${poolmember } --%>
<c:forEach var="memberlist" items="${poolmember }" varStatus="status">
	<div class=gender_${memberlist.gender}>
		<img src="${memberlist.profile}">
		${memberlist.usrNick}
		${memberlist.approve}
	</div>
</c:forEach>	
</div>
<a onclick="showWrite()">
잘
</a>
<c:import url="/WEB-INF/views/sns/mySNS.jsp" />

<div class="col-md-12">
	<c:forEach var="post" items="${post}" varStatus="status">
		<div class="col-md-6 col-md-offset-4">
		<p> TITLE: ${post.title}  </p>
		<p> CONTENTS : ${post.contents}  </p>
		<c:forEach var="postpic" items="${postPic}" varStatus="picStatus">
			<c:if test="${post.postSeq ==postpic.postSeq}">
				<img src="/poorip${postpic.path }/${postpic.fileName }">
			</c:if>
		</c:forEach>
		</div>
	</c:forEach>
</div>
	
</body>
</html>