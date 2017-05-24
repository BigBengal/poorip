<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 풀파티</title>
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
<!-- Google font -->	
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Kaushan+Script|Pacifico" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/moment.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/transition.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/collapse.js"></script> -->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
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
<!-- 상단 메뉴 및 기본 -->
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<!-- Custom Scripts -->
<script src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
<!-- facebook  -->
<script src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
<!-- Vaildation-->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.validate.min.js"></script>
<script>
		
function aprvConfirmDialog(poolMemSeq, poolPartySeq, usrSeq){
	
	 $( "#dialog-confirm_aprv" ).dialog({
	    resizable: false,
	    height: "auto",
	    width: 400,
	    modal: true,
	    buttons: {
	      "Confirm": function() {
	        console.log(poolMemSeq + ',' + poolPartySeq + ',' + usrSeq)
	     	// Ajax 통신
			$.ajax( {
			    url : "${pageContext.request.contextPath }/poolparty/invite/aprv",
			    type: "post",
			    dataType: "json",
			    data: "poolpartySeq="+poolPartySeq+"&usrSeq="+usrSeq,
			//  contentType: "application/json",
			    success: function( response ){
			    	console.log	( response );
			       if( response.result == "fail") {
			    	   console.log( response );
			    	   return;
			       }
			    	//통신 성공 (response.result == "success" )
					console.log( "APPROVE" + response.data );
			    	$( "#request-"+poolMemSeq ).hide();
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );
			    }

			   });
	        $( this ).dialog( "close" );
	      },
	      Cancel: function() {
	        $( this ).dialog( "close" );
	      }
	    }
	  });
}

function rejectConfirmDialog(poolMemSeq, poolPartySeq, usrSeq){
	
	 $( "#dialog-confirm_reject" ).dialog({
	    resizable: false,
	    height: "auto",
	    width: 400,
	    modal: true,
	    buttons: {
	      "Confirm": function() {
	        console.log(poolMemSeq + ',' + poolPartySeq + ',' + usrSeq)
	     // Ajax 통신
			$.ajax( {
			    url : "${pageContext.request.contextPath }/poolparty/invite/reject",
			    type: "post",
			    dataType: "json",
			    data: "poolpartySeq="+poolPartySeq+"&usrSeq="+usrSeq,
			//  contentType: "application/json",
			    success: function( response ){
			    	console.log	( response );
			       if( response.result == "fail") {
			    	   console.log( response );
			    	   return;
			       }
			    	//통신 성공 (response.result == "success" )
					console.log( "APPROVE" + response.data );
			    	$( "#request-"+poolMemSeq ).hide();
			    	
			    },
			    error: function( XHR, status, error ){
			       console.error( status + " : " + error );
			    }

			   });
	        $( this ).dialog( "close" );
	      },
	      Cancel: function() {
	        $( this ).dialog( "close" );
	      }
	    }
	  });
}
</script>
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
	<div id="banner" class="banner-addinfo">
		<div class="banner-addinfo-image banner-image-common" style="top:-80px">
			<div class="backstretch mypage-backstretch">
				<img
					src="${pageContext.request.contextPath }/assets/images/bg-image-5.jpg">
			</div>
		</div>
		<div class="banner-caption">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 object-non-visible"
						data-animation-effect="fadeIn">
					<h1 class="text-center">
						Poorip <span>와 인연</span>
					</h1>
					</div>
				</div>

		</div>
	</div>
	<!-- banner end -->
	<div class="container">
		<div class="row col-lg-12 col-md-12 col-sm-12">
			<div class="text-center">
				<h2>내 풀파티 리스트</h2>
			</div>
		
			<div class="row col-lg-12 col-md-12 	">
				<c:forEach var="myPoolList" items="${myPoolList}">
					<div class="col-md-6 poolparty">
						<a href="${myPoolList.poolSeq}">
						<div class="col-md-6">
						<img src="/poorip${myPoolList.poolPic }" class="img100">
						</div>
						<div class="col-md-6">
						${myPoolList.poolName}<br>
						${myPoolList.poolComment}
						</a>
						</div>
						
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="row col-lg-12 col-md-12 col-sm-12">
			<div class="text-center">
				<h2>대기 중인 풀파티 리스트</h2>
			</div>
			<div class="row col-lg-12 col-md-12 col-sm-12">
				<c:forEach var="myPoolList" items="${myWaitPoolList}">
					<div class="col-md-6 poolparty">
						<a href="${myPoolList.poolSeq}">
						
						<div class="col-md-6">
						<img src="/poorip${myPoolList.poolPic }" class="img100">
						</div>
						<div class="col-md-6">
						
						${myPoolList.poolName}
						${myPoolList.poolComment}
						</a>
						</div>	
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="row col-lg-12 col-md-12 col-sm-12">
			<div class="text-center">
				<h2>요청 리스트</h2>
			</div>
			<div class="row">
				<c:forEach var="requestList" items="${requestList}">
					<div class="col-md-6 poolmember" id="request-${requestList.poolMemSeq}">
						
						<div class="col-md-4">
							<img src="/poorip${requestList.poolPic}">
						</div>
						${requestList.poolInfo}
						<span class="poolmemberlist">
						<img src="${requestList.profile}">
							${requestList.usrNick}
						<button class="btn btn-small" onclick="aprvConfirmDialog(${requestList.poolMemSeq},${requestList.poolSeq},${requestList.usrSeq});">수락 </button>
						<button class="btn btn-small" onclick="rejectConfirmDialog(${requestList.poolMemSeq},${requestList.poolSeq},${requestList.usrSeq});">거절</button>
						</span>
						</div>
				</c:forEach>
			</div>
			<div id="dialog-confirm_aprv" title="요청 리스트 수락" style="display:none">
			  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>요청를 수락하시겠습니까?</p>
			</div>
			<div id="dialog-confirm_reject" title="요청 리스트 거절" style="display:none">
			  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>요청를 거절하시겠습니까?</p>
			</div>
		</div>
	</div>
	<div class="se-pre-con"></div>
	<!-- footer start -->
	<!-- ================ -->
	<footer id="footer">
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</footer>
	<!-- footer end -->
</body>
</html>