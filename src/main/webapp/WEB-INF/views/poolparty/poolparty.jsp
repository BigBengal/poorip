<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip에 오신것을 환영합니다! - Pool</title>

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

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Fugaz+One|Kaushan+Script|Pacifico"
	rel="stylesheet">
<!--  Masonry layout -->
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/moment.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/transition.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/collapse.js"></script> -->

<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/sockjs.min.js"></script>	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- jquery ellipsis -->
<script
	src="${pageContext.request.contextPath }/assets/js/jquery.ellipsis.js"></script>

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
<%-- <script src="${pageContext.request.contextPath }/assets/js/custom.js"></script> --%>
<!-- 상단 메뉴 및 기본 -->
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<!-- facebook  -->
<script
	src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
<!-- Vaildation-->
<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){

	$(".banner-image").backstretch('/poorip/assets/images/bg-image-7.jpg');				
		
// 	$("#navbar-collapse-1 ul li").eq(0).removeClass("active");
// 	$("#navbar-collapse-1 ul li").eq(1).addClass("active");
	
	$(function(){
		$("#ctyName").autocomplete({
	        source : function(request, response) {
	            $.ajax({
	                url : "search",
	                type : "post",
	                dataType : "json",
	                data: "kwd="+$("#ctyName").val(),
	                success : function(data) {
	                    var result = data;
//		                     console.log(JSON.stringify(result.data));
	                    response(
	                            $.map($.parseJSON(JSON.stringify(result.data)), function(item) {
	                                return {
	                                    label: item.name,
	                                    value: item.name
	                                }
	                            })
	                        );
	                },
	                error : function(data) {
//		                     alert("ajax 에러가 발생하였습니다.")
	                }
	            });
	        },
			select : function( event, ui ) {
				$('#ctyName').val(ui.item.value);
				searchPool();
			}
	    });
	});
	
	$('form').submit(function(e){
	    e.preventDefault();
	    searchPool();
	});
	
	
	$( ".datepick" ).datepicker({
    	dateFormat: 'yy/mm/dd',
    	showOtherMonths: true,
        selectOtherMonths: true,
        autoclose: true,
        changeMonth: true,
        changeYear: true,
    });
	
}); // End document ready

function searchPool(){
   	$("#searchArea").empty();
	// Ajax 통신
	$('html, body').animate({
        scrollTop: $("#poolsearchtop").offset().top -100
      }, 800, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = "#poolsearchtop";
      });
	$.ajax( {
	    url : "poolparty/poolsearchList",
	    type: "post",
	    dataType: "json",
	    data: "ctyName="+$("#ctyName").val()+
	    	  "&fromDate="+$("#from").val()+
	    	  "&toDate="+$("#to").val(),
	    	  
	//  contentType: "application/json",
	    success: function( response ){
	    	console.log(response);
	       if( response.result != "success" ) {
	    	    console.log("fail");
	    		console.log( response.message );
	    		return;
	    	}
	    	if( response.data.length == 0 ) {
	    		console.log("end");
	    		$("#searchArea").append("<div class='col-md-12 pool-not-found' >아쉽지만 찾으시는 여행지의 풀파티가.. 아직은 없습니다! 하나 만들어보는건 어떠신가요?</div>");
	    		isEnd = true;
	    		return;
	    	}
	    	console.log("ok");
			$( response.data ).each( function(index, vo){
				var html =  "<div class='col-md-4 poolmember'>" +
							"<div class='col-md-5 text-right'>" +
								"<a href='poolparty/"+vo.poolSeq+"'>"+
									"<img src='/poorip"+vo.poolPic+"'>"+
							"</div>" +
								"<p style='text-align:center;'>" + vo.poolName + "</p>" +
							"</a>"+
							"<div>"+
							"<p>" + vo.poolComment + "</p>" +
							"<div class='pool-cityndate'>" +
							"<p style='text-align:center;'>[" +vo.ctyName +  "]&nbsp" + vo.fromDate + "&nbsp - &nbsp" + vo.toDate + "</p>" +														
							"</div>" +
							"</div>";
				$("#searchArea").append(html);
			})
			return
				
	    },
	    error: function( XHR, status, error ){
	       console.error("Err");
	    }

   });
}

// function openOptions() {
// 	document.getElementById("profileDropdown").classList.toggle("show");
// }

</script>
</head>
<body class="no-trans" style="background:#ececec;">
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
				<!-- 				<img -->
				<%-- 					src="${pageContext.request.contextPath }/assets/images/bg-image-4.jpg"> --%>
			</div>
		</div>
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 object-non-visible"
						data-animation-effect="fadeIn">
						<h1 class="text-center">
							<span style="font-family: 'Pacifico', cursive; color: white;">PoOrip</span>
							<span>과 함께 가요 </span>
						</h1>
						<p class="lead text-center">함께 즐기는 여행</p>
						<form class="navbar-form lead text-center" role="search">
							<div class="form-group" style="width: 52.5%; margin: auto">
								<input style="width: 100%;" type="text" class="form-control"
									id="ctyName" placeholder="도시를 입력해주세요">
							</div>
							<button type="submit" class="btn btn-default"
								style="border-radius: 5px;">FIND</button>
							<p class="lead">
							<p>

								<input style="border-radius: 5px;" type="text" id="from"
									name="fromDate" class="datepick blackcolor"> ~ <input
									style="border-radius: 5px;" type="text" id="to" name="toDate"
									class="datepick blackcolor">
						</form>

					</div>
				</div>

				<!-- 					<div class="row col-lg-4 col-md-4 col-sm-4"></div> -->
				<!-- 					<form class="navbar-form navbar-left" role="search"> -->
				<!-- 					<div class="form-group"> -->
				<!-- 						<input type="text" class="form-control" id="ctyName" placeholder="Search"> -->
				<!-- 					</div> -->
				<!-- 					<button type="submit" class="btn btn-default">Submit</button> -->

				<!-- 					</form> -->

				<!-- 				<div class="row col-lg-12 col-md-12 col-sm-12"> -->

				<!-- 					<div class="form-group"> -->

				<!-- 					<div class="navbar-form"> -->
				<!-- 					<label for="from">출발</label>  -->
				<!-- 					<input type="text" id="from" name="fromDate" class="datepick"> -->
				<!-- 					<label for="to">도착</label> -->
				<!-- 					<input type="text" id="to" name="toDate" class="datepick" > -->

				<!-- 					</div> -->
				<!-- 					</div> -->

			</div>
		</div>
	</div>
	<div class="pool-party-content" style="background-color:#ececec;" id="poolsearchtop">
	<div class="container" >
		<div style="font-family: 'Nanum Pen Script', serif;  text-align: center">
			<h2 style="margin: 40px 0;"><img style="width: 60px; height: 60px; margin-left: 48%;" src="/poorip/assets/images/firework.png" style="width:50px; height:50px;"/>
			<strong>Member 모집 중인 Pool 파티</strong></h2>
			<h3 style="margin-bottom:5%;">공개 된 모든 풀파티가 모여있는 공간입니다.</h3>
		</div>
		<div class="row col-lg-12 col-md-12 col-sm-12" id="searchArea"
			style="margin-top: 10px;margin: auto;">
			<c:forEach var="list" items="${top10 }">
				<div class="col-md-4 poolmember" >
					<div class="col-md-5 text-right">
						<a href="poolparty/${list.poolSeq}"> <img
							src="/poorip${list.poolPic}">
						</a>
						
					</div>
					<a href="poolparty/${list.poolSeq}">
					<p>${list.poolName}</p>
					</a>

				
					<div class="pool-comment">
						<p>${list.poolComment }</p>
						
					</div>
					<div class="pool-cityndate">
					<c:if test="${null ne list.ctyName|| list.ctyName!=null}">
						<p class="pool-date">[${list.ctyName}] ${list.fromDate } - ${list.toDate }</p>
						</c:if>
					</div>
				</div>


			</c:forEach>
		</div>
	</div>
	</div>
	<!-- banner end -->

	<!-- 							<p class="text-center" style="text-align: center;"> -->
	<!-- 							<label for="from">출발</label>  -->
	<!-- 							<input type="text" id="fromDate" name="fromDate" style="color: #000000; border-radius: 10px"> -->
	<!-- 							<label for="to" style="margin-left: 5px">도착</label> -->
	<!-- 							<input type="text" id="toDate" name="toDate" style="color: #000000; border-radius: 10px; margin-top: 10px"> -->
	<!-- 							<input type="submit" id="serch" value="검색하기" onclick="searchformSubmit()" -->
	<!-- 								style="width: 75; font-family: 맑은고딕; background-color: black"> -->
	<!-- 						</p> -->
	<!-- 					</form> -->
	<div class="se-pre-con"></div>

	<!-- footer start -->
	<!-- ================ -->
	<footer id="footer" style="background-color: #ececec;">
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</footer>
	<!-- footer end -->

</body>
</html>