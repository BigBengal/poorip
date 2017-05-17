<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
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
<!-- Bootstrap toggle -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/moment.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/transition.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/collapse.js"></script> -->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
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
<%-- <script src="${pageContext.request.contextPath }/assets/js/template.js"></script>  --%>
<!-- 상단 메뉴 및 기본 -->
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<!-- Custom Scripts -->
<script src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
<!-- facebook  -->
<script src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
<!-- Vaildation-->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.validate.min.js"></script>
<!-- Bootstrap toggle -->
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script type="text/javascript">
// 	$(function() {
// 		$('#datetimepicker1').datetimepicker();
// 	});
 </script> -->
<script>
$(document).ready(function(){


// 	var $alink = $("#navbar-collapse-1 ul li a");
// 	for(var i=0;i<2;i++){
// 		var $ori = $alink.eq(i);
// 		var oriLink = $ori.attr("href")
// 		$ori.attr("href",oriLink);	 
// 	}
	 var validator = $("form[name='addinfo']").validate({
		 	ignore: ".ignore",
		 	onkeyup: false, //turn off auto validate whilst typing
		    // Specify validation rules
		    rules: {
		      // The key name on the left side is the name attribute
		      // of an input field. Validation rules are defined
		      // on the right side
		     usrNick: {
		        required: true,
		        minlength: 2,
		        remote : "/poorip/user/isExistNick"
		        // Specify that email should be validated
		        // by the built-in "email" rule
// 		        remote : {
// 	                url : "/poorip/user/isExistNick",
// 	                type : "get",
// 	    		    dataType: "json",
// 	    		    data: {
// 	    		    	nick: function()
//                         {
//                             return $('#nickname').val();
//                         }
//                     },
	 				
// 	    		//  contentType: "application/json",
// 	    		    success: function( response ){
// 	    		    	console.log	( response );
// 	    		       if( response.result == "failed") {
// 	    		    	   console.log( response );
// 	    		       }
// 	    		    	//통신 성공 (response.result == "success" )
	    		    	
// 	    		    	if( response.data == "exists" ) {
// 	    		    		$("#checknick").addClass("has-warning");
// 	    		    		$("#checknick").removeClass("has-success")
// 	    		    		alert("존재하는 아이디 입니다. 다른 이메일을 사용해 주세요");
// // 	    		    		$("#checknick label").removeClass("ignore");
// 	    		    		$("#nickname").focus();
// 	    		    		return "invalid";
	    		    			    		    		
// 	    		    	} else if (response.data == "not exists"){
// 	    		    		$("#checknick").addClass("has-success");
// 	    		    		$("#checknick").removeClass(" has-warning")
// //  	    		    		$("#checknick label").addClass("ignore");
// // 	    		    		$("#nickname").removeClass("pending");
// 	    		    		 return "valid";
	    		    		 
// 	    		    	}
// // 	    		       return '"true"';
// 	    		    }
// 	            }
		      }
		    },
		    // Specify validation error messages
		    messages: {
		    	usrNick:{ 	required :"Please enter your Nickname(Mininum:2)",
		    				minlength : "mininum is 2",
		    				remote : "check nickname"
		    	}
		    },
		    // Make sure the form is submitted to the destination defined
		    // in the "action" attribute of the form when valid
		   
		    submitHandler: function(form) {
		    	form.submit();
		      
		    }
		  });
	 $("form[name='addinfo']").removeAttr('novalidate');
	$( function() {
		    $( "#datetimepicker1" ).datepicker({
		    	dateFormat: 'yy/mm/dd',
	            showOtherMonths: true,
	            selectOtherMonths: true,
	            autoclose: true,
	            changeMonth: true,
	            changeYear: true,
	            //gotoCurrent: true,
		            
		    });
		    
		  } );
	$.backstretch("/poorip/assets/images/bg-image-3.jpg");
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
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<h1 class="text-center" style="color:grey">
							회원 정보 수정
						</h1>
					
				</div>
			</div>
		</div>
	</div>
	<!-- banner end -->
<form class="form-horizontal" action="addinfosave" name="addinfo">	
	<input class="ignore" type="hidden" name="usrSeq" value="${authUser.usrSeq}">
	<div class="form-group" id="checknick">
		<label class="control-label col-sm-3" for="nickname">이름(NickName)</label>
		<c:choose>
			<c:when test="${user.usrNick == null}" >
				<div class="col-sm-7">
					<input type="text" class="form-control" id="nickname" name="usrNick" value="${user.usrNick }"
						placeholder="한번 정하면 바꿀 수 없습니다.">
				</div>
			</c:when>
			<c:otherwise>
				<p class="form-control-static col-sm-7">${user.usrNick}</p>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-3" for="option">언어(Lauguage)</label>
		
		<div class="btn-group col-sm-7" data-toggle="buttons">
			
			<c:choose>
				<c:when test="${user.usrLang=='KOR'}">
					<label class="btn btn-primary active" id="langKor">
				</c:when>
				<c:otherwise>
				 	<label class="btn btn-primary" id="langKor">
				</c:otherwise>
				
			</c:choose>
				<input type="radio" name="usrLang" value="KOR" id="option1" autocomplete="off"> KOR
			</label>
			<c:choose>
				<c:when test="${user.usrLang=='ENG'}">
					<label class="btn btn-primary active" id="langEng">
				</c:when>
				<c:otherwise>
				 	<label class="btn btn-primary" id="langEng">
				</c:otherwise>
			</c:choose>
				<input type="radio" name="usrLang" value="ENG" id="option2" autocomplete="off"> ENG
			</label>
			
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-3" for="birthday">생년월일(Birthday)</label>
		
		<c:choose>
			<c:when test="${user.usrBd == null}" >
				<div class='date col-sm-7' id='datetimepicker1' data-date-format="yyyy/mm/dd">
                    <input type='text' class="form-control" name="usrBd" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar" id="datetimepicker1"></span>
                    </span>
                </div>
			</c:when>
			<c:otherwise>
				<p class="form-control-static col-sm-7">${user.usrBd}</p>
			</c:otherwise>
		</c:choose>        
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-3" for="info">자기소개(Info)</label>
		<div class='col-sm-7'>
			<textarea class="form-control" id="info" name="usrInfo" rows="3">${user.usrInfo}</textarea>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-3" for="hashTag">해쉬태그(HashTag)</label>
		<div class='col-sm-7'>
			<textarea class="form-control" id="hashTag" name="usrHashtag" rows="2">${user.usrHashtag}</textarea>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-3" for="Noti">알람(Notification)</label>
		
		<div class="col-sm-2">
			
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${user.usrNoti=='Y'}"> --%>
<!-- 					<label class="btn btn-default active" id="notiY"> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 				 	<label class="btn btn-default" id="notiY"> -->
<%-- 				</c:otherwise> --%>
				
<%-- 			</c:choose> --%>
<!-- 				<input type="radio" name="usrNoti" value="Y" id="noti1" autocomplete="off"> On -->
<!-- 			</label> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${user.usrNoti=='N'}"> --%>
<!-- 					<label class="btn btn-default active" id="notiN"> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 				 	<label class="btn btn-default" id="notiN"> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 				<input type="radio" name="usrNoti" value="N" id="noti2" autocomplete="off"> Off -->
				
<!-- 			</label> -->
			<c:choose>
				<c:when test="${user.usrNoti=='Y'}">
					<input type="checkbox" name="usrNoti" value="Y" checked data-toggle="toggle">
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="usrNoti" value="Y" data-toggle="toggle">
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-3"></div>
		<div class="col-sm-7">
			<button type="submit" class="btn btn-default col-lg-6 center-block">Save</button>
		</div>
	</div>
</form>
	
</body>
</html>