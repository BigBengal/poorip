<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip에 오신것을 환영합니다! - 풀 파티</title>

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
<!-- Bootstrap toggle -->
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<!-- lightBox -->
<link href="${pageContext.request.contextPath}/assets/css/lightbox.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/css/sweetalert.css"
	rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="/poorip/assets/plugins/jquery-3.2.1.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/moment.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/transition.js"></script> -->
<!-- <script src="/poorip/assets/bootstrap/js/collapse.js"></script> -->
<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
<!-- <script src="/poorip/assets/plugins/jquery-1.12.4.js"></script> -->
<script
	src="${pageContext.request.contextPath }/assets/js/sockjs.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>

<script src="/poorip/assets/plugins/jquery-ui.min.js"></script>
<!-- sweet alert -->
<script
	src="${pageContext.request.contextPath }/assets/js/sweetalert.min.js"></script>

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
<!-- 상단 메뉴 및 기본 -->
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>

<script
	src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
<!-- Light Box -->
<script src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>
<!-- Vaildation-->
<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.validate.min.js"></script>
<!-- Bootstrap toggle -->
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<!-- PoolParty Detail Js-->
<script
	src="${pageContext.request.contextPath }/assets/js/poolparty_detail.js"></script>
<!-- Custom Scripts -->
<%-- <script src="${pageContext.request.contextPath }/assets/js/custom.js"></script> --%>
<script src="http://malsup.github.com/jquery.form.js"></script>
<!-- Gallera image slider -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/galleria/1.5.7/galleria.min.js"></script>

<!-- facebook  -->
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Fugaz+One|Kaushan+Script|Pacifico"
	rel="stylesheet">
</head>
<body>
<body class="no-trans" style="background-color: #f2f2f2;">
	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

	<!-- header start -->
	<!-- ================ -->
	<header class="header fixed clearfix navbar navbar-fixed-top"
		style="background-color: initial;">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
	</header>
	<!-- header end -->
	<div style="height: 200px;"></div>
	
		<div class="pool-detail-backgroundimg">
		<c:if test="${authUser.usrSeq == pool.managerUsrSeq }">
			<a href="javascript:;">
			</c:if> 
			<img src="/poorip${pool.poolMainPic}"
				style="width: 100%; object-fit: cover; height: 100%; border-radius: 10px;"
				id="pool-main-pic" data-toggle="modal"
				data-target="#poolparty-Img-Modal"> 
			</a>				
				<c:if test="${authUser.usrSeq == pool.managerUsrSeq }">
				<a href="javascript:;">
				<img
				src="${pageContext.request.contextPath }/assets/images/camera1.png"
				data-toggle="modal" data-target="#poolparty-Img-Modal"
				id="pool-image-change" style="border-radius: 10px;">
				</a>

			<div id="poolparty-Img-Modal" class="modal fade" role="dialog">
				<div class="poolpartyimg-dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="poolparty-Img-title">
								<form class="form-horizontal" id="pool-image-form" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="poolSeq" value="${pool.poolSeq}">
									<input type="hidden" name="usrSeq" value="${authUser.usrSeq}"
										id="authuser-pool"> <input type="hidden"
										name="managerSeq" value="${pool.managerUsrSeq}">
									<div class="sns-modal-title">
										<h3>이미지 변경</h3>
									</div>
									<div class="write-main block" id="sns-write"
										style="margin-right: 5%;">

										<div class="form-group sns-write-group">
											<div style="margin-top: 30px;">
												<label class="control-label col-sm-3" for="file">사진
													올리기</label>
												<div class="col-sm-7">
													<input type="file" name="file" accept='images/*'
														id="pool-img-upload" style="vertical-align: bottom;">
												</div>
											</div>
										</div>


										<div class="form-group sns-write-group"
											style="margin-left: 0px; text-align: center; margin: 5%;">

											<button type="submit" class="sns-post-footer gray_button"
												id="pool-img-changebtn" style="width: 30%;">이미지 변경</button>
											<button type="button" class="sns-post-footer gray_button"
												data-dismiss="modal" style="width: 30%;">닫기</button>
										</div>

									</div>
									<div class="container"></div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
	</c:if>	
		</div>
	
	<div class="container" style="position: relative">
		<!-- 풀파티 설정 -->
		<div id="dialog-form" title="풀파티 설정 변경">
			<form class="form-horizontal" id="poolsetting" action="saveSetting"
				method="post" enctype="multipart/form-data">
				<fieldset>
					<input type="hidden" id="poolSeq" name="poolSeq"
						value="${pool.poolSeq}">
					<div class="form-group">
						<label class="control-label" for="name">풀파티 제목</label> <input
							type="text" name="poolName" id="name" value="${pool.poolName}"
							class="text ui-widget-content ui-corner-all">
					</div>
					<div class="form-group">
						<label class="control-label" for="comment">풀파티 코멘트</label> <input
							type="text" name="poolComment" id="comment"
							value="${pool.poolComment}" maxlength="150"
							class="text ui-widget-content ui-corner-all">
					</div>
					<div class="form-group">
						<label class="control-label" for="pic">풀파티 이미지</label> <input
							type="file" name="poolPicture" id="pic"
							class="text ui-widget-content ui-corner-all">
					</div>

					<div class="form-group">
						<label for="control-label" for="city">대표 도시</label> <select
							id="city" name="ctySeq">
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
								<input type="checkbox" name="poolPublicYn" value="Y" checked
									data-toggle="toggle" class="btn btn-default btn-xs" style="width:100px;height:20px;">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="poolPublicYn" value="Y"
									data-toggle="toggle" class="btn btn-default btn-xs" style="width:100px;height:20px;">
							</c:otherwise>
						</c:choose>

					</div>
					<div class="form-group">
						<label class="control-label" for="fromdate"> 여행기간</label> <input
							type="text" name="fromDate" id="fromdate"
							value="${pool.fromDate}"
							class="datepicker text ui-widget-content ui-corner-all">
						~ <input type="text" name="toDate" id="todate"
							value="${pool.toDate}"
							class="datepicker text ui-widget-content ui-corner-all">
					</div>

					<!-- Allow form submission with keyboard without duplicating the dialog button -->
					<input type="submit" tabindex="-1"
						style="position: absolute; top: -1000px">
				</fieldset>
			</form>
		</div>
		<div class="pool-detail-name">
			<h1 style="color: white; text-shadow: 0 0 40px #000000;">${pool.poolName}</h1>
		</div>
		
		<c:forEach var="memberlist" items="${poolmember }" varStatus="status">

		<c:if test="${memberlist.usrSeq == authUser.usrSeq && memberlist.approve == 'Y' }">
		<div id="leave-party" style="display: none;">
			<form action="${pageContext.request.contextPath }/poolparty/leaveparty" method="post" id="leave-party-yes">
			<h6 style="text-align:center;">'탈퇴' 를 입력하세요</h6>
			<input type="text" class="leavepartyconfirm">
			<input type="hidden" name="managerSeq" value="${pool.managerUsrSeq}">
			<input type="hidden" name="poolSeq" value="${pool.poolSeq }" id="poolSeq">
			</form>
		</div>
		<div class="pool-party-chatting-${pool.poolSeq } pool-party-chat" style="display:none;">
			<input type="hidden" name="memName" value="${memberlist.usrNick}" id="chatusrNick">
			<input type="hidden"	name="memUsrSeq" value="${memberlist.usrSeq }" id="memUsrSeq">
			<input type="hidden" name="poolSeq" value="${pool.poolSeq }" id="chatPoolSeq">
			<input type="text" id="message-${pool.poolSeq }" /> <input type="button"
				id="sendMessage-${pool.poolSeq }" value="보내기" />

			<div id="chatMessage-${pool.poolSeq }" style="overflow: auto; max-height: 500px;"></div>
		</div>
		</c:if>
		</c:forEach>
		<!-- 풀파티 상단 내용 -->
		<div class="col-md-9 pool-partydetail-header">
			<div class="col-md-5">
				<img style="border-radius: 2px;" src="/poorip${pool.poolPic}">
			</div>
			<div class="col-md-7 pool-setting-header">

				<div class="col-md-2 pool-like">
					<c:choose>
						<c:when test="${like == true}">
							<div id="poollike" class="poollikeon menu_links" data-onoff="off">
								${pool.likeCnt}</div>

						</c:when>
						<c:otherwise>
							<div id="poollike" class="poollikeoff menu_links" data-onoff="on">
								${pool.likeCnt}</div>

						</c:otherwise>
					</c:choose>

					

				</div>
				<div class="col-md-10">

					<div class="pooldetails" data-usrseq="${pool.managerUsrSeq}">
						<div style="position: relative; display: inline-block;">

							<img src="${pool.managerProfile}" width="50px">
						</div>
						<div style="display: inline-block; position: absolute; margin-left:5%;">
							<h4>
								<strong>${pool.managerUsrNick }</strong>
							</h4>
						</div>
					</div>
					<c:if test="${pool.fromDate != null or pool.toDate != null}">
					<h5 class="pooltraveldate">
						
						 여행 기간  [ ${pool.fromDate} ~ ${pool.toDate} ] 
					</c:if>
					<c:if test="${pool.ctyName != null}">
							( ${pool.ctyName} )
					</h5>		
					</c:if>
					<c:if test="${pool.poolComment ne null }">
					<h6 class="poolindivcomment">${pool.poolComment}</h6>
					</c:if>
				</div>
				
			</div>
			<c:if test="${authUser != null and memberYn == 'NO'}">
						<div id="reqeustjoin">
							<a onclick="reqeustJoin()" class="menu_links" style="text-decoration: none;">가입요청</a>
						</div>
					</c:if>
					<c:if test="${authUser != null and memberYn == 'ING'}">
						<div id="reqeustjoin">승인 대기중</div>
					</c:if>
			<c:if test="${authUser.usrSeq == pool.managerUsrSeq}">
					<div id="pool-setting">
						<button type="button" class="sns-post-footer menu_links modify gray_button"
							style="min-width: 100px;">Settings</button>
					</div>
				</c:if>

		</div>
		<!-- 풀파티 맴버 -->
		<div class="col-md-2 hidden-xs pool-member-window">
			<div id="pool-member-listTitle">
				<strong>풀파티 맴버</strong>
			</div>
			<c:forEach var="memberlist" items="${poolmember }" varStatus="status">
						
				<c:if test="${memberlist.usrSeq == pool.managerUsrSeq }">
					<img
						style="width: 25px; position: absolute; right: 10%; top: 60px;"
						src="${pageContext.request.contextPath }/assets/images/crown.png">
				</c:if>
				<div
					class="gender_${memberlist.gender} aprove${memberlist.approve} poolmemberlist menu_links"
					data-usrseq="${memberlist.usrSeq}">
					<img src="${memberlist.profile}" width="50px">
					<h6 style="display: inline-block;">
						<strong>${memberlist.usrNick}</strong>
					</h6>
					<c:if test="${memberlist.approve == 'N'}">
						<h6 style="display: inline-block;">
							<strong>(승인대기중)</strong>
						</h6>
					</c:if>
				</div>
			</c:forEach>
			<c:if test="${authUser.usrSeq == pool.managerUsrSeq}">
				<div class="input-group" style="margin: 5px;">
					<input type="text" id="inviteNick" class="form-control"
						placeholder="Nickname"> <span class="input-group-btn">
						<button class="btn btn-default btn-xsmall" type="button"
							onclick="invite()">Invite</button>
					</span>
				</div>
				<div id="inviteMsg"></div>
			</c:if>
		</div>

		<!-- <div id="write" class="col-md-12"> -->
		<c:import url="/WEB-INF/views/poolparty/poolparty_write.jsp" />
		<!-- </div> -->

		<!-- 글 쓰기 버튼-->
		<c:forEach var="memberlist" items="${poolmember }" varStatus="status">
			<c:if
				test="${memberlist.usrSeq ==authUser.usrSeq && memberlist.approve == 'Y'}">
				<div style="text-align: center; margin-right: 12%;">
					<button type=button class="sns-write-button"
						data-text="Enter text here"
						style="width: 64%; cursor: text; min-width: 300px;/*margin-top: 100px; margin-bottom: 30px*/;"
						data-toggle="modal" data-target="#sns-write-form2">
						<img alt="글쓰기" src="/poorip/assets/images/write-btn.png"
							class="sns-post-footer"
							style="width: 2%; display: inline-block; margin-right: 10px; margin-left: 10px;">
						<span style="color: #bfbfbf;">Share Your Story With Others
							...</span>
					</button>
				</div>
			</c:if>
		</c:forEach>
		
		<!-- 글보기 -->
		<div id="postList" class="col-md-12">
			<c:forEach var="post" items="${post}" varStatus="status">
				<div id="post-${post.postSeq}"
					class="col-md-7 col-md-offset-4 pool-detail-post"
					style="margin-left: 15%;">
					<c:set var="doneLoop" value="false" />
					<c:forEach var="memberlist" items="${poolmember }"
						varStatus="status">
						<c:if test="${not doneLoop}">

							<c:choose>
								<c:when test="${post.usrSeq == memberlist.usrSeq }">

									<c:if test="${memberlist.gender eq 'F' }">
					<div class="row margin_up_down post-header female">
											<c:set value="true" var="member" />
											<c:set var="doneLoop" value="true" />
									</c:if>
									<c:if test="${memberlist.gender eq 'M' }">
					<div class="row margin_up_down post-header male">
											<c:set value="true" var="member" />
											<c:set var="doneLoop" value="true" />
									</c:if>

								</c:when>
								<c:otherwise>
									<c:set value="false" var="member" />
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
					<c:if test="${member==false }">
					<div class="row margin_up_down post-header nonmember">
					</c:if>

						<div class="col-md-6 img_inline">
							<img src="${post.picture}"
								style="float: left; margin-left: 5px; margin-bottom: 5px;">
							<h6>${post.name}</h6>
							<c:if test="${post.trvName ne '관련 여행정보 없음' }">
								<h6>
									in <span style="color: rgba(22, 39, 125, 0.55);">${post.trvName }
										</span>
								</h6>
							</c:if>
						</div>
						<div class="col-md-6"
							style="text-align: right; margin-top: 5%; font-size: 0.9em; float: right; margin-top: 0px;">${post.crtDate}</div>
						<div style="font-size: 20px; position: absolute; margin-top: 28px;margin-left: 62px;">
							<strong>${fn:substring(post.title,0,32)}<c:if test="${fn:length(post.title) > 32}">...</c:if></strong>
						</div>
					</div>
				<p style="text-align: left; margin-left: 30px;">${fn:replace(post.contents, newLine, "<br>")}</p>
				
				<!-- 갤러리아 라이브러리 붙일 자리 -->
				<c:set var="galleriaPosition" value="N" />
				<c:forEach var="postpic" items="${postPic}" varStatus="picStatus">
					<c:if test="${post.postSeq == postpic.postSeq}">
						<c:if test="${galleriaPosition == 'N'}">
							<div class="galleria" id="postPic-${postpic.postSeq}">
						</c:if>

						<img src="/poorip${postpic.path}/${postpic.fileName}"
							data-seq="${postpic.postSeq}">

						<c:set var="galleriaPosition" value="Y" />
					</c:if>
				</c:forEach>

				<c:if test="${galleriaPosition == 'Y'}">
							</div>
				</c:if>
				

				<div class="row margin_up_down underline" style="margin:auto; width:100%; display:inline-block;">
					<div class="col-md-3 sns-button-left">
						<c:if test="${authUser.usrSeq == post.usrSeq}">
							<%-- <img alt='수정' src='/poorip/assets/images/post_modify.png'
										class="menu_links modify" data-postseq="${post.postSeq}"
										style="max-height: 30px;"> --%>
							<button class='modify gray_button'
								data-postseq="${post.postSeq}"
								style=' width: 70px; margin: auto;'>수정</button>

						</c:if>
					</div>
					
					<c:if test="${not empty authUser.usrSeq}">
					<div class="col-md-3 sns-button-center">
						<button class='sharepost gray_button'
							data-postseq="${post.postSeq}" data-usrseq="${post.usrSeq}"
							style=' width: 70px; margin: auto;'>공유</button>
					</div>
					</c:if>
					
					<div class="col-md-3 col-md-offset-6 sns-button-right">
						<c:if test="${authUser.usrSeq == post.usrSeq}">
							<button class='rightalign delete gray_button'
								data-postseq="${post.postSeq}" data-usrseq="${post.usrSeq}"
								style=' width: 70px;'>삭제</button>
						</c:if>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

	<div id="loading" class="col-md-10 col-md-offset-2"
		style="margin: auto;"></div>

	<!-- 프로필 보기 다이얼로그 -->
	<div id="profile" title="프로필 보기" ></div>
	<div id="dialog-confirm_delete" title="삭제 확인" style="display: none">
		<p>
			<span class="ui-icon ui-icon-alert"
				style="float: left; margin: 12px 12px 20px 0;"></span>삭제 하시겠습니까?
		</p>
	</div>


	<div id="dialog-confirm_share" title="공유 확인" style="display: none">
		<p>
			<span
				style="float: left; margin: 12px 12px 20px 0;"></span>내 SNS로
			가져가시겠습니까?
		</p>
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