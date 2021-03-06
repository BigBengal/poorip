<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-md-3">

		<!-- header-left start -->
		<!-- ================ -->
		<div class="header-left clearfix">

			<!-- logo -->
			<div class="logo smooth-scroll">
				<a href="${pageContext.request.contextPath}/" ><img id="logo"
					src="${pageContext.request.contextPath }/assets/images/poorip_logo_small.png"
					alt="poorip"></a>
			</div>

			<!-- name-and-slogan -->
			<div class="site-name-and-slogan smooth-scroll">
				<div class="site-name">
					<a href="${pageContext.request.contextPath}" style="font-family: 'Pacifico', cursive;">PoOrip</a>
				</div>
				<!-- <div class="site-slogan">
					<a target="_blank" href="http://htmlcoder.me">HtmlCoder</a>
				</div> -->
			</div>

		</div>
		<!-- header-left end -->

	</div>
	<div class="col-md-9">

		<!-- header-right start -->
		<!-- ================ -->
		<div class="header-right clearfix">

			<!-- main-navigation start -->
			<!-- ================ -->
			<div class="main-navigation animated">

				<!-- navbar start -->
				<!-- ================ -->
				<nav class="navbar navbar-default" role="navigation">
					<div class="container-fluid">

						<!-- Toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target="#navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse scrollspy smooth-scroll"
							id="navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/poorip/#portfolio" style="font-family: 'Kaushan Script', cursive;">Travel Info</a></li>
								<li><a href="/poorip/matching/survey" style="font-family: 'Kaushan Script', cursive;">Party People</a></li>
								<li><a href="/poorip/poolparty" style="font-family: 'Kaushan Script', cursive;">PoolParty</a></li>
								<li id="MyMenuHover"><a href="#" style="font-family: 'Kaushan Script', cursive;">MyPage</a></li>
								<li><a><fb:login-button scope="public_profile,email,user_birthday" auto_logout_link="true" onlogin="checkLoginState();">
									   </fb:login-button></a>									
						  		</li>
						  		<li><a><img id="loginpic" src="${authUser.usrProfile}" width="50" height="50"></a></li>
						  		<c:if test="${!empty authUser}">
						  			<a href="/poorip/poolparty/mypool#notify"><span class="my-badge">${notify}</span></a>
						  		</c:if>
<%-- 								<li><a href=#><img onclick="openOptions()" id="loginpic" src="${authUser.usrProfile}"></a></li> --%>
							</ul>
<!-- 							<div id="profileDropdown" class="dropdown-content" style="margin-left: 25px; margin-top:3px;"> -->
<%-- 					    		<a href="${pageContext.request.contextPath }/sns">내 SNS</a> --%>
<%-- 					    		<a href="${pageContext.request.contextPath }/scrap/main">내 스크랩 정보</a> --%>
<%-- 					    		<a href="${pageContext.request.contextPath }/poolparty/mypool">내 풀파티</a> --%>
<%-- 					    		<a href="${pageContext.request.contextPath }/user/addinfo">사용자 정보 수정</a> --%>
<!-- 					  		</div> -->
						</div>

					</div>
				</nav>
				<!-- navbar end -->

			</div>
			<!-- main-navigation end -->

		</div>
		<!-- header-right end -->

	</div>
</div>
<div id="myMenu" class="container dropdown-content myMenushow">
	<a href="${pageContext.request.contextPath }/sns" style="font-family: 'Kaushan Script', cursive;">Story</a>
	<a href="${pageContext.request.contextPath }/scrap/main" style="font-family: 'Kaushan Script', cursive;">Scrap</a>
	<a href="${pageContext.request.contextPath }/poolparty/mypool" style="font-family: 'Kaushan Script', cursive;">Pool</a>
	<a href="${pageContext.request.contextPath }/user/addinfo" style="font-family: 'Kaushan Script', cursive;">Profile</a>
</div>