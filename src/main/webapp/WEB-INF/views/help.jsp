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

<!-- Google font -->	
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Kaushan+Script|Pacifico" rel="stylesheet">
<!--  Sweet Alert -->
<link href="${pageContext.request.contextPath }/assets/css/sweetalert.css"
	rel="stylesheet">

<style>
  body {
      position: relative;
  }
  ul.nav-pills {
      top: 20px;
      position: fixed;
  }
  div.col-sm-9 div {
      height: 250px;
      font-size: 28px;
  }
  #section1 {color: #fff; background-color: #1E88E5;}
  #section2 {color: #fff; background-color: #673ab7;}
  #section3 {color: #fff; background-color: #ff9800;}
  #section41 {color: #fff; background-color: #00bcd4;}
  #section42 {color: #fff; background-color: #009688;}
  
  @media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section41, #section42  {
        margin-left: 150px;
    }
  }
</style>
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
	<div id="banner" class="banner-addinfo banner">
		<div class="banner-image1 banner-image-common">
			<div class="backstretch mypage-backstretch" style="position:relative;">
				<img
					src="${pageContext.request.contextPath }/assets/images/question_marks.jpg">
			</div>
		</div>
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 object-non-visible"
						data-animation-effect="fadeIn">
						<h1 class="text-center" style="color: black;">
							홈페이지 이용안내
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<c:import url="/WEB-INF/views/include/tutorial.jsp"></c:import>
		</div>
	</div>


	<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
	<div class="se-pre-con"></div>
	<!-- footer start -->
	<!-- ================ -->
	<footer id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</footer>
	<!-- footer end -->
	
	
	
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
	 <!--  Sweet Alert -->
<script src="${pageContext.request.contextPath }/assets/js/sweetalert.min.js"></script>
	
	<!-- Light Box -->
	<script src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- facebook  -->
	<script src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/template.js"></script>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/ajax.js"></script>
	
	<!-- Custom Scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
	<!-- Gallera image slider -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/galleria/1.5.7/galleria.min.js"></script>

</body>
</html>