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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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

<!-- multiselect -->
<link
	href="${pageContext.request.contextPath}/assets/css/multi-select.css"
	rel="stylesheet">

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Fugaz+One|Kaushan+Script|Pacifico"
	rel="stylesheet">
	<!-- toggle checkbox css -->
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">	
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
	<div id="banner" class="banner-addinfo">
		<div class="banner-image-sns banner-image-common">
			<div class="backstretch mypage-backstretch">
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
							${authUser.usrNick}'s <br> <span style="font-family:'Pacifico'">Travel Story</span>
						</h1>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- banner end -->

	<!-- mySNS start -->
	<!-- ================ -->
	<div id="mySNS" class="mySNS" style="background-color: #f2f2f2;" scrolling="auto">
		
		<c:import url="/WEB-INF/views/sns/mySNS.jsp" />
		<div class="container" style="width:50%; min-width:400px;">
	<div id="my-sns-list" class="block" style="padding-top: 100px">
	</div>
	</div>
	</div>
	

	<!-- footer end -->
	
	
	
	<script
		src="${pageContext.request.contextPath }/assets/plugins/jquery-1.12.4.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/plugins/jquery-ui.min.js"></script>

	<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->

	<!-- Jquery and Bootstap core js files -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script>
	
	

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


	<!-- facebook  -->
	<script
		src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>

	<!-- Light Box -->
	<script src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>

	<!-- sns ajax -->
	<script src="${pageContext.request.contextPath }/assets/js/sns-ajax.js"></script>

	<!-- multiselect -->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/multiselect.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/plugins/multiselect.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/portBox.js"></script>
		<script
		src="${pageContext.request.contextPath }/assets/js/portBox.slimscroll.min.js"></script>
	
	<!--  toggle-checkbox -->
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>	

	<div id="delete-sns-post" title="SNS 포스트 삭제" style="display: none">
		<p>
			<span class="ui-icon ui-icon-alert"
				style="float: left; margin: 12px 12px 20px 0;"></span>이 글을 정말로
			삭제하시겠습니까?
		</p>
	</div>

	<!-- 공유 창 내용 -->
	<div id="share-sns-post" title="SNS 포스트 공유" style="display: none">
		<p>공유할 풀을 선택해주세요 ${postSeq }</p>
		<form action="${pageContext.request.contextPath}/sns/post/share"
			id="share-form">
			<input id="sns-share-postSeq" type="hidden" name="postSeq"
				value="${postSeq }">
			<div class="form-group">
				<div class="row">
					<div class="col-xs-5">
						<select name="share_from[]" class="js-multiselect1 form-control"
							size="8" multiple="multiple">
							<c:forEach items="${poolpartyList }" var="poolpartyList"
								varStatus="status">
								<option value="${poolpartyList.poolSeq }">${poolpartyList.poolName }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-xs-2">
						<button type="button" id="js_right_All_2" class="btn btn-block">
							<i class="glyphicon glyphicon-forward"></i>
						</button>
						<button type="button" id="js_right_Selected_2"
							class="btn btn-block">
							<i class="glyphicon glyphicon-chevron-right"></i>
						</button>
						<button type="button" id="js_left_Selected_2"
							class="btn btn-block">
							<i class="glyphicon glyphicon-chevron-left"></i>
						</button>
						<button type="button" id="js_left_All_2" class="btn btn-block">
							<i class="glyphicon glyphicon-backward"></i>
						</button>
					</div>
					<div class="col-xs-5">
						<select name="share_to[]" id="js_multiselect_to_2"
							class="form-control" size="8" multiple="multiple"></select>
					</div>
				</div>
			</div>
			<div class="form-group sns-write-group sns-buttons">
				<div class="col-md-12" style="padding-left: 40%">
					<button type="submit" class="sns-post-footer" style="width:30%">공유하기</button>
				</div>
			</div>
		</form>
	</div>
	<div class="se-pre-con"></div>
	<!-- footer start -->
	<!-- ================ -->
	<footer id="footer" style="background-color:#f2f2f2">
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</footer>
	<!-- footer end -->
</body>
</html>