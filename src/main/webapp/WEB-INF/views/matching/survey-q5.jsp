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
						<h1 class="text-center" style="font-size: 50px">
							<span style="font-size: 50px; color: teal;">Q5</span> 1장의 사진을
							골라주세요.
						</h1>
						<p class="lead text-center"></p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12" data-animation-effect="fadeIn">
						<label class="col-sm-6 col-md-4"> <input type="radio"
							name="fb" value="1" /> <img
							src="${pageContext.request.contextPath }/assets/images/swim.jpg"
							style="width: 250px">
						</label> <label class="col-sm-6 col-md-4"> <input type="radio"
							name="fb" value="2" /> <img
							src="${pageContext.request.contextPath }/assets/images/skydiving.jpg"
							style="width: 250px">
						</label> <label class="col-sm-6 col-md-4"> <input id="fb3"
							type="radio" name="fb" value="3" /> <img
							src="${pageContext.request.contextPath }/assets/images/Paragliding.jpg"
							style="width: 250px">
						</label>
					</div>
					<div class="col-md-12" data-animation-effect="fadeIn">
						<label class="col-sm-6 col-md-4"> <input id="fb4"
							type="radio" name="fb" value="4" /> <img
							src="${pageContext.request.contextPath }/assets/images/mountain_bike.jpg"
							style="width: 250px">
						</label> <label class="col-sm-6 col-md-4"> <input id="fb4"
							type="radio" name="fb" value="5" /> <img
							src="${pageContext.request.contextPath }/assets/images/biking_racing.jpg"
							style="width: 250px">
						</label>
					</div>
				</div>

			</div>
			<div class="form-group">
				<div class="col-md-8 col-md-offset-2 object-non-visible"
					data-animation-effect="fadeIn">
					<div class="form-group">
						<p class="col-md-4">
							<a
								href="${pageContext.request.contextPath }/matching/survey-main">
								<img alt=""
								src="${pageContext.request.contextPath }/assets/images/Left.png"
								style="width: 80px; display: inline-block; float: left;">
							</a>
						</p>
						<p class="col-md-4"></p>
						<p class="col-md-4">
							<a href="${pageContext.request.contextPath }/matching/main/matching">
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


<c:import url="/WEB-INF/views/include/survey-script.jsp"></c:import>