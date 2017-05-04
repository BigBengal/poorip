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
<!-- Bootstrap toggle -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- <script src="/poorip/assets/bootstrap/js/moment.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/transition.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/collapse.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
<!-- Bootstrap toggle -->
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script>
var writeVisible = false;	//글쓰기 버튼
var poolikeyn = false; 		//풀파티 좋아요 버튼 flag
var isEnd = false; // 프로필 가져오기 Data 종료

$(document).ready(function(){
	
	// 풀파티 설정 다이얼로그 
	dialog = $( "#dialog-form" ).dialog({
	    	autoOpen: false,
	        height: 480,
	        width: 600,
	        modal: true,
	        buttons: {
	          "Save": function submit_form(){
	        	    $('#poolsetting').submit();
	          },
	          Cancel: function() {
	            dialog.dialog( "close" );
	          }
	        },
	        close: function() {
	        	dialog.dialog( "close" );
	        }
	  } );
	
	$( "#setting" ).on( "click", function() {
	      dialog.dialog( "open" );
	    });
	
	
	// 풀파티 맴버 프로필 보기
	$(".poolmemberlist").on("click", function() {
		var usrSeq = $(this).data("usrseq");
		console.log(usrSeq);
		
		// Ajax 통신
		$.ajax( {
		    url : "/poorip/user/getProfile",
		    type: "post",
		    dataType: "json",
		    data: { "usrSeq" : usrSeq },
		    success: function( response ){
		    	var usrInfo = "";
				var scrapCityInfo = "";
// 		    	var scrapInfo = "";
// 				var lastCity = "";
		    	
		    	console.log	( response );
			       if( response.result == "fail") {
			    	   console.log( response );
			    	   return;
			       }
// 			       	if( response.data.scrapcity.length== 0 ) {
// 			    		isEnd = true;
// 			    		return;
// 			    	}
			    	//통신 성공 (response.result == "success" )
			    	if(response.result == "success" ) {
			    		usrInfo += "<p> 닉네임 : " + response.data.profile.usrNick + "</p>";
			    		usrInfo += "<p> <img src=" + response.data.profile.usrProfile + "></p>";
			    		usrInfo += "<p> 자기소개 : ";
			    		if (response.data.profile.usrInfo != null )
					    	usrInfo += response.data.profile.usrInfo + "</p>";
				    	else
				    		usrInfo += "없음 </p>";
					    usrInfo += "<p> 해쉬태그 : ";
			    		if (response.data.profile.usrHashtag != null )
			    			usrInfo += response.data.profile.usrHashtag + "</p>";
			    		else 
			    			usrInfo += "없음 </p>";
			    		
			    		$( response.data.scrapcity ).each( function(index, vo){
			    			//스크랩 도시 정보
			    			scrapCityInfo += "<p> 방문 예정 나라 : " + vo.ctyName + " ( ";
			    			if (vo.dateFrom != null )
			    				scrapCityInfo += vo.dateFrom;
			    			if (vo.dateTo != null )	
			    				scrapCityInfo += " ~ " + vo.dateTo; 
							if (vo.dateFrom == null && vo.dateTo == null)	
								scrapCityInfo += "미정";
							scrapCityInfo += " )</p>";
			    			
			    		});	
// 			    		$( response.data.scrap ).each( function(index, vo){
// 			    			//스크랩 정보
// 		 				});

			    		$("#profile").html(usrInfo + scrapCityInfo);	
			    	}
			    	
			    	
// 			    	$( response.data.scrap ).each( function(index, vo){
// 					})
					
			       return true;
		    }
		   });
		
		
		$( "#profile" ).dialog({
// 	    	autoOpen: false,
	        height: 400,
	        width: 450,
	        modal: true,
	        buttons: {
	          Close: function() {
	        	$(this).dialog( "close" );
	          }
	        }
	  } );
	});
	
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
	
	// Fixed header
	//-----------------------------------------------
	$(window).scroll(function() {
		if (($(".header.fixed").length > 0)) { 
			if(($(this).scrollTop() > 0) && ($(window).width() > 767)) {
				$("body").addClass("fixed-header-on");
			} else {
				$("body").removeClass("fixed-header-on");
			}
		};
	});

	$(window).load(function() {
		if (($(".header.fixed").length > 0)) { 
			if(($(this).scrollTop() > 0) && ($(window).width() > 767)) {
				$("body").addClass("fixed-header-on");
			} else {
				$("body").removeClass("fixed-header-on");
			}
		};
		var likeonoff = $("#poollike").data("onoff");
		console.log("likeonoff:"+likeonoff);
		if(likeonoff == 'on'){
			console.log("on");
			poolikeyn = true;
		} else {
			console.log("off");
			poolikeyn = false;
		}
			
	});
	
	$( ".datepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        selectOtherMonths: true,
        autoclose: true,
        changeMonth: true,
        changeYear: true,
    });
	
		
	$("#poollike").click(function(){
		console.log("poolikeyn:"+poolikeyn)
		likeToggle(poolikeyn);
	});
		
});
function showWrite(){
	if ( writeVisible == true ) {
		$("#write").hide();	
		writeVisible = false;
	} else {
		$("#write").show();
		writeVisible = true;
	}
	
}

function likeToggle(poolike){

	$.ajax({
	          url : "liketoggle",
	          type : "post",
	          dataType : "json",
	          data: { "poolpartySeq" : ${pool.poolSeq} },
	          success: function(data) {
	          	if(data.result != "success"){
	          		console.log("err");
	          		return
	          	}
	        	if (poolike == false){
	        		$("#poollike").removeClass("poollikeon");
		  			$("#poollike").addClass("poollikeoff");
		  			poolikeyn = true;
		  			console.log(data.data);
		  			$("#poollike").text(data.data);
	        	} else {
	        		$("#poollike").removeClass("poollikeoff");
	        		$("#poollike").addClass("poollikeon");
	        		poolikeyn = false;
	        		console.log(data.data);
	        		$("#poollike").text(data.data);
	        	} 
	          }
	        		
	      });
}
function reqeustJoin(){
	console.log("reqeustJoin");
	// Ajax 통신
	$.ajax( {
	    url : "invite",
	    type: "post",
	    dataType: "json",
	    data: { "poolpartySeq" : ${pool.poolSeq} },
	    success: function( response ){
	    	console.log	( response );
		       if( response.result == "fail") {
		    	   console.log( response );
		    	   return;
		       }
	    	//통신 성공 (response.result == "success" )
	    	if(response.result == "success" ) {
	    		$("#reqeustjoin").text("요청중");
	    	}
	       return true;
	    }
	   });
	
	
}
function invite() {
	console.log("invite");
	
	if ($("#inviteNick").val() == ""){
		$("#inviteMsg").text("닉네임입력하세요");
		return;
	}
	$.ajax( {
	    url : "invite",
	    type: "post",
	    dataType: "json",
	    data: { "poolpartySeq" :${pool.poolSeq},
	    	    "usrNm" : $("#inviteNick").val() },
	    success: function( response ){
	    	console.log	( response );
		       if( response.result == "fail") {
		    	   $("#inviteMsg").text("요청실패");
		    	   return;
		       }
	    	//통신 성공 (response.result == "success" )
	    	if(response.result == "success" ) {
	    		$("#inviteMsg").text("요청완료");
	    	}
	       return true;
	    }
	   });
}

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


<!-- 풀파티 설정 -->
<div id="dialog-form" title="풀파티 설정 변경">
<form class="form-horizontal" id="poolsetting" action="saveSetting" method="post" enctype="multipart/form-data">
<fieldset>
	<input type="hidden" name="poolSeq" value="${pool.poolSeq}">
	<div class="form-group">
		<label class="control-label" for="name">풀파티 제목</label>
		<input type="text" name="poolName" id="name" value="${pool.poolName}" class="text ui-widget-content ui-corner-all">
	</div>
	<div class="form-group">
		<label class="control-label" for="comment">풀파티 코멘트</label>
		<input type="text" name="poolComment" id="comment" value="${pool.poolComment}" class="text ui-widget-content ui-corner-all">
	</div>
	<div class="form-group">
		<label class="control-label" for="pic">풀파티 이미지</label>
		<input type="file" name="poolPicture" id="pic" class="text ui-widget-content ui-corner-all">
	</div>
	
	<div class="form-group">
		<label for="control-label" for="city">대표 도시</label>
		<select id="city" name="ctySeq">
			<option></option>
			<c:forEach items="${cityList }" var="cityList" varStatus="status">
				<c:choose>
				<c:when test="${pool.ctySeq == cityList.ctySeq}">
					<option value="${cityList.ctySeq }" selected>${cityList.ctyName }</option>
				</c:when>
				<c:otherwise>
					<option value="${cityList.ctySeq }">${cityList.ctyName }</option>
				</c:otherwise>
				</c:choose>
				
			</c:forEach>
		</select>		
	</div>
	<div class="form-group">
		<label for="control-label" for="public">공개 여부</label>
		<input type="checkbox" name="poolPublicYn" value="Y" checked data-toggle="toggle" class="btn btn-default btn-xs">
	</div>
	<div class="form-group">
		<label class="control-label" for="fromdate"> 여행기간</label>
		<input type="text" name="fromDate" id="fromdate" value="${pool.fromDate}" class="datepicker text ui-widget-content ui-corner-all"> ~
		<input type="text" name="toDate" id="todate" value="${pool.toDate}" class="datepicker text ui-widget-content ui-corner-all">
	</div>
	
	<!-- Allow form submission with keyboard without duplicating the dialog button -->
	<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
</fieldset>
</form>
</div>


<!-- 풀파티 상단 내용 -->
<div class="col-md-10">
	<div class="col-md-5">
		<img src="/poorip${pool.poolPic}">
	</div>
	<div class="col-md-7">
		<div class="col-md-10">
		<h1>${pool.poolName} 
		</h1>
		</div>
		<div class="col-md-2">
			<c:choose>
				<c:when test="${like == true}">
					<div id="poollike" class="poollikeon menu_links" data-onoff="off">
					${pool.likeCnt}
					</div>
				</c:when>
				<c:otherwise>
					<div id="poollike" class="poollikeoff menu_links" data-onoff="on">
					${pool.likeCnt}
					</div>
				</c:otherwise>
			</c:choose>
			<c:if test="${authUser.usrSeq == pool.managerUsrSeq}">
				<div>
				<img src="/poorip/assets/images/gear.png" width="30px" id="setting" class="menu_links">
				</div>
			</c:if>
		<c:if test="${authUser != null and memberYn == 'NO'}">
			<div id="reqeustjoin">
			<a onclick="reqeustJoin()" class="menu_links">가입요청</a>
			</div>
		</c:if>
		<c:if test="${authUser != null and memberYn == 'ING'}">
			<div id="reqeustjoin">
			요청중
			</div>
		</c:if>
		
		</div>
	<div class="col-md-12">
	<h3>${pool.poolComment} </h3>
	<p class="poolmemberlist"> 관리자 : <img src="${pool.managerProfile}"> ${pool.managerUsrNick } </p>

	<h5>
	<c:if test="${pool.fromDate != null or pool.toDate != null}">
	 여행 기간 : ${pool.fromDate} ~ ${pool.toDate} 
	</c:if>
	<c:if test="${pool.ctyName != null}">
		( ${pool.ctyName} )
	</c:if>
	</h5>
	</div>
	</div>

</div>
<!-- 풀파티 맴버 -->
<div class="col-md-2 hidden-xs">
풀파티 맴버
<c:forEach var="memberlist" items="${poolmember }" varStatus="status">
	<div class="gender_${memberlist.gender} aprove${memberlist.approve} poolmemberlist menu_links" data-usrseq="${memberlist.usrSeq}">
		<img src="${memberlist.profile}"> ${memberlist.usrNick}<c:if test="${memberlist.approve == 'N'}">(승인대기중)</c:if>
	</div>
</c:forEach>
<c:if test="${authUser.usrSeq == pool.managerUsrSeq}">
	<div class="input-group">
      <input type="text" id="inviteNick" class="form-control" placeholder="Nickname">
      <span class="input-group-btn">
        <button class="btn btn-default btn-xsmall" type="button" onclick="invite()">Invite</button>
      </span>
    </div>
    <div id="inviteMsg"></div>
</c:if>	
</div>

<!-- 글쓰기 -->
<div id="write">
<%-- <c:import url="/WEB-INF/views/sns/mySNS.jsp" /> --%>
</div>

<!-- 글 보기 -->
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

<!-- 프로필 보기 다이얼로그 -->
<div id="profile" title="프로필 보기">
</div>
</body>
</html>