<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<c:import url="/WEB-INF/views/include/survey-background.jsp" />

<!-- banner start -->
<!-- ================ -->
<div id="banner" class="banner">
	<div class="banner-image">
		<div class="backstretch">
			<img
				src="${pageContext.request.contextPath }/assets/images/bg-image-6.jpg">
		</div>
	</div>
	<div class="banner-caption">
		<div class="container">
			<div class="row">
				<div class="form-group">
					<div class="col-md-8 col-md-offset-2 object-non-visible"
						data-animation-effect="fadeIn">
						<p class="lead text-center">함께 동행할 SoulMate를 찾기 위한 절차입니다.</p>
						<h1 class="text-center" style="font-size: 50px">
							<span style="font-size: 75px; color: teal;">${authUser.usrNick}님</span>의
							<br>성향 조사를 시작하시겠습니까?
						</h1>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-8 col-md-offset-2 object-non-visible"
						data-animation-effect="fadeIn">
						<div class="form-group">
							<p class="col-md-4">
								<a href="${pageContext.request.contextPath }/"> <img alt=""
									src="${pageContext.request.contextPath }/assets/images/refresh.png"
									style="width: 80px; display: inline-block; float: left;"></a>
							</p>
							<p class="col-md-4"></p>
							<p class="col-md-4">
								<a href="${pageContext.request.contextPath }/matching/survey-Q1">
									<img alt=""
									src="${pageContext.request.contextPath }/assets/images/Right.png"
									style="width: 80px; display: inline-block; float: right;">
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/survey-script.jsp"></c:import>