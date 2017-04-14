<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-md-4">

		<!-- header-left start -->
		<!-- ================ -->
		<div class="header-left clearfix">

			<!-- logo -->
			<div class="logo smooth-scroll">
				<a href="${pageContext.request.contextPath}/"><img id="logo"
					src="${pageContext.request.contextPath }/assets/images/poorip_logo_small.png"
					alt="poorip"></a>
			</div>

			<!-- name-and-slogan -->
			<div class="site-name-and-slogan smooth-scroll">
				<div class="site-name">
					<a href="#banner">PoOrip</a>
				</div>
				<!-- <div class="site-slogan">
					<a target="_blank" href="http://htmlcoder.me">HtmlCoder</a>
				</div> -->
			</div>

		</div>
		<!-- header-left end -->

	</div>
	<div class="col-md-8">

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
								<li class="active"><a href="#banner">poOrip</a></li>
								<li><a href="#portfolio">여행정보</a></li>
								<li><a href="#clients">풀친구</a></li>
								<li><a href="#contact">건의사항</a></li>
							</ul>
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