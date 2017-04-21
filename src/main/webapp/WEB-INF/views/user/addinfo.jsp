<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/poorip/assets/bootstrap/css/bootstrap-datepicker.min.css" />
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
<script src="/poorip/assets/bootstrap/js/moment.js"></script>
<script src="/poorip/assets/bootstrap/js/transition.js"></script>
<script src="/poorip/assets/bootstrap/js/collapse.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>
<!-- Modernizr javascript -->
<script src="${pageContext.request.contextPath }/assets/plugins/modernizr.js"></script>
<!-- Isotope javascript -->
<script src="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.pkgd.min.js"></script>
<!-- Backstretch javascript -->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.backstretch.min.js"></script>
<!-- Appear javascript -->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.appear.js"></script>
<!-- Initialization of Plugins -->
<!-- <script src="${pageContext.request.contextPath }/assets/js/template.js"></script>  -->
<!-- Custom Scripts -->
<script src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
<!-- facebook  -->
<script src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script type="text/javascript">
// 	$(function() {
// 		$('#datetimepicker1').datetimepicker();
// 	});
 </script> -->
<script>
$(document).ready(function(){
	var $alink = $("#navbar-collapse-1 ul li a");
	for(var i=0;i<4;i++){
		var $ori = $alink.eq(i);
		var oriLink = $ori.attr("href")
		$ori.attr("href","/poorip/"+oriLink);	 
	}
});

</script>
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
	<div id="banner" class="banner-addinfo">
		<div class="banner-addinfo-image">
			<div class="backstretch">
			</div>
		</div>
	</div>
<form class="form-horizontal" action="user/addreqsave">
	<div class="form-group">
		<label class="control-label col-sm-3" for="nickname">이름(NickName)</label>
		<div class="col-sm-8">
			<input type="text" class="form-control" id="nickname"
				placeholder="NickName">
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-3" for="language">언어(Lauguage)</label>
		<div class="btn-group col-sm-8" role="group" aria-label="language">
			<button type="button" id="language" value="KOR" class="btn btn-default">한국어</button>
			<button type="button" id="language" value="ENG" class="btn btn-default">English</button>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-3" for="birthday">생년월일(Birthday)</label>
		
		        <div class='btn-group date col-sm-8' id='datetimepicker1'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar" id="birthdate"></span>
                    </span>
                </div>
            

	</div>

	<div class="form-group">
		<div class="col-sm-3"></div>
		<button type="submit" class="btn btn-default col-sm-3 center-block">Save</button>
	</div>
	</form>

</body>
</html>