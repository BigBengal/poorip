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
<!-- lightBox -->
<link href="${pageContext.request.contextPath}/assets/css/lightbox.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- <script src="/poorip/assets/bootstrap/js/moment.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/transition.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/collapse.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="/poorip/assets/plugins/jquery-1.12.4.js"></script>
<script src="/poorip/assets/plugins/jquery-ui.min.js"></script>
 
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
<!-- Light Box -->
<script src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>
<!-- Vaildation-->
<script src="${pageContext.request.contextPath }/assets/plugins/jquery.validate.min.js"></script>
<!-- Bootstrap toggle -->
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<!-- PoolParty Detail Js-->
<script src="${pageContext.request.contextPath }/assets/js/poolparty_detail.js"></script>

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
	<input type="hidden" id="poolSeq" name="poolSeq" value="${pool.poolSeq}">
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
			<option value="0"></option>
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
		<c:choose>
			<c:when test="${pool.poolPublicYn =='Y'}">
				<input type="checkbox" name="poolPublicYn" value="Y" checked data-toggle="toggle" class="btn btn-default btn-xs">
			</c:when>
			<c:otherwise>
				<input type="checkbox" name="poolPublicYn" value="Y" data-toggle="toggle" class="btn btn-default btn-xs">
			</c:otherwise>
		</c:choose>
		
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
	<p class="poolmemberlist" data-usrseq="${pool.managerUsrSeq}"> 관리자 : <img src="${pool.managerProfile}"> ${pool.managerUsrNick } </p>

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

<!-- <div id="write" class="col-md-12"> -->
<c:import url="/WEB-INF/views/poolparty/poolparty_write.jsp" />
<!-- </div> -->

<!-- 글 보기 -->
<div id="postList" class="col-md-12">
	<c:forEach var="post" items="${post}" varStatus="status">
		<div id="post-${post.postSeq}" class="col-md-6 col-md-offset-4">
		<h3>${post.title}  </h3>
		<c:forEach var="postpic" items="${postPic}" varStatus="picStatus">
			<c:if test="${post.postSeq ==postpic.postSeq}">
				<a href="/poorip${postpic.path}/${postpic.fileName}" data-lightbox="${postpic.postSeq}" data-title="${post.title}">
					<img src="/poorip${postpic.path}/${postpic.fileName}">
				</a>
			</c:if>
		</c:forEach>
		<p> ${post.contents}  </p>
			<div class="row margin_up_down">
			<div class="col-md-6 img_inline">
				<img src="${post.picture}"> ${post.name}
			</div>
			<div class="col-md-6">
				${post.crtDate}
			</div>
			</div>
			<div class="row margin_up_down underline">
			<div class="col-md-3">
				<c:if test="${authUser.usrSeq == post.usrSeq}">
					<img alt='수정' src='/poorip/assets/images/post_modify.png' class="menu_links modify" data-postseq="${post.postSeq}" style="max-height: 30px;">
				</c:if>
			</div>
			<div class="col-md-3 col-md-offset-6">
				<c:if test="${authUser.usrSeq == post.usrSeq}">
					<img alt='삭제' src='/poorip/assets/images/post_delete.png' class="menu_links rightalign delete" data-postseq="${post.postSeq}" data-usrseq="${post.usrSeq}" style="max-height: 30px;">
				</c:if>
			</div>
			</div>
		
		</div>
	</c:forEach>
</div>
<div id="loading" class="col-md-10 col-md-offset-2">
</div>

<!-- 프로필 보기 다이얼로그 -->
<div id="profile" title="프로필 보기">
</div>
<div id="dialog-confirm_delete" title="삭제 확인" style="display:none">
  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>삭제 하시겠습니까?</p>
</div>
</body>
</html>