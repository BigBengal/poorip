<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/matching/surveyQ.jsp"></c:import>
<body class="no-trans">
	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

	<!-- banner start -->
	<!-- ================ -->
	<div id="banner" class="banner" style="background: #E0FFFF">
		<div class="backstretch"></div>
	</div>
	<form id="survey-form" action="${pageContext.request.contextPath }/matching/updatePrefer">
	<!-- banner end -->
	<div class="targetDiv" id="div1">
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-2 text-center"
							data-animation-effect="fadeIn">
							<h1 class="text-center" style="font-size: 50px">
								<span style="font-size: 50px; color: teal;">Q1</span> 1장의 사진을
								골라주세요.
							</h1>
							<p class="lead text-center"></p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group" id="q1">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref1"> <input id="q1-1"
								type="radio" name="usrPref1" value="1" /> <img
								src="${pageContext.request.contextPath }/assets/images/swim.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref1"> <input id="q1-2"
								type="radio" name="usrPref1" value="2" /> <img
								src="${pageContext.request.contextPath }/assets/images/skydiving.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref1"> <input id="q1-3"
								type="radio" name="usrPref1" value="3" /> <img
								src="${pageContext.request.contextPath }/assets/images/Paragliding.jpg"
								style="width: 250px">
							</label>
						</div>
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref1"> <input id="q1-4"
								type="radio" name="usrPref1" value="4" /> <img
								src="${pageContext.request.contextPath }/assets/images/mountain_bike.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref1"> <input id="q1-5"
								type="radio" name="usrPref1" value="5" /> <img
								src="${pageContext.request.contextPath }/assets/images/biking_racing.jpg"
								style="width: 250px">
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<p class="col-md-4">
								<a
									href="${pageContext.request.contextPath }/matching/survey">
									<img id="prev" alt="prev"
									src="${pageContext.request.contextPath }/assets/images/Left.png"
									style="width: 80px; display: inline-block; float: left;">
								</a>
							</p>
							<p class="col-md-4"></p>
							<p class="col-md-4">
								<a class="showSingle" target="2">
									<img alt="next"
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
	<!-- banner end -->
	<div class="targetDiv" id="div2" style="display: none">
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-2 text-center"
							data-animation-effect="fadeIn">
							<h1 class="text-center" style="font-size: 50px">
								<span style="font-size: 50px; color: teal;">Q2</span> 1장의 사진을
								골라주세요.
							</h1>
							<p class="lead text-center"></p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group" id="q2">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref2"> <input id="q2-1"
								type="radio" name="usrPref2" value="1" /> <img
								src="${pageContext.request.contextPath }/assets/images/swim.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref2"> <input id="q2-2"
								type="radio" name="usrPref2" value="2" /> <img
								src="${pageContext.request.contextPath }/assets/images/skydiving.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref2"> <input id="q2-3"
								type="radio" name="usrPref2" value="3" /> <img
								src="${pageContext.request.contextPath }/assets/images/Paragliding.jpg"
								style="width: 250px">
							</label>
						</div>
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref2"> <input id="q2-4"
								type="radio" name="usrPref2" value="4" /> <img
								src="${pageContext.request.contextPath }/assets/images/mountain_bike.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref2"> <input id="q2-5"
								type="radio" name="usrPref2" value="5" /> <img
								src="${pageContext.request.contextPath }/assets/images/biking_racing.jpg"
								style="width: 250px">
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<p class="col-md-4">
								<a class="showSingle" target="1">
									<img alt="pre"
									src="${pageContext.request.contextPath }/assets/images/Left.png"
									style="width: 80px; display: inline-block; float: left;">
								</a>
							</p>
							<p class="col-md-4"></p>
							<p class="col-md-4">
								<a class="showSingle" target="3">
									<img alt="next"
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
	<!-- banner end -->
	<div class="targetDiv" id="div3" style="display: none">
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-2 text-center"
							data-animation-effect="fadeIn">
							<h1 class="text-center" style="font-size: 50px">
								<span style="font-size: 50px; color: teal;">Q3</span> 1장의 사진을
								골라주세요.
							</h1>
							<p class="lead text-center"></p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group" id="q3">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref3"> <input id="q3-1"
								type="radio" name="usrPref3" value="1" /> <img
								src="${pageContext.request.contextPath }/assets/images/swim.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref3"> <input id="q3-2"
								type="radio" name="usrPref3" value="2" /> <img
								src="${pageContext.request.contextPath }/assets/images/skydiving.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref3"> <input id="q3-3"
								type="radio" name="usrPref3" value="3" /> <img
								src="${pageContext.request.contextPath }/assets/images/Paragliding.jpg"
								style="width: 250px">
							</label>
						</div>
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref3"> <input id="q3-4"
								type="radio" name="usrPref3" value="4" /> <img
								src="${pageContext.request.contextPath }/assets/images/mountain_bike.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref3"> <input id="q3-5"
								type="radio" name="usrPref3" value="5" /> <img
								src="${pageContext.request.contextPath }/assets/images/biking_racing.jpg"
								style="width: 250px">
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<p class="col-md-4">
								<a class="showSingle" target="2">
									<img alt="pre"
									src="${pageContext.request.contextPath }/assets/images/Left.png"
									style="width: 80px; display: inline-block; float: left;">
								</a>
							</p>
							<p class="col-md-4"></p>
							<p class="col-md-4">
								<a class="showSingle" target="4">
									<img alt="next"
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
	<div class="targetDiv" id="div4" style="display: none">
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-2 text-center"
							data-animation-effect="fadeIn">
							<h1 class="text-center" style="font-size: 50px">
								<span style="font-size: 50px; color: teal;">Q4</span> 1장의 사진을
								골라주세요.
							</h1>
							<p class="lead text-center"></p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group" id="q4">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref4"> <input id="q4-1"
								type="radio" name="usrPref4" value="1" /> <img
								src="${pageContext.request.contextPath }/assets/images/swim.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref4"> <input id="q4-2"
								type="radio" name="usrPref4" value="2" /> <img
								src="${pageContext.request.contextPath }/assets/images/skydiving.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref4"> <input id="q4-3"
								type="radio" name="usrPref4" value="3" /> <img
								src="${pageContext.request.contextPath }/assets/images/Paragliding.jpg"
								style="width: 250px">
							</label>
						</div>
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref4"> <input id="q4-4"
								type="radio" name="usrPref4" value="4" /> <img
								src="${pageContext.request.contextPath }/assets/images/mountain_bike.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref4"> <input id="q4-5"
								type="radio" name="usrPref4" value="5" /> <img
								src="${pageContext.request.contextPath }/assets/images/biking_racing.jpg"
								style="width: 250px">
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<p class="col-md-4">
								<a class="showSingle" target="3">
									<img alt="pre"
									src="${pageContext.request.contextPath }/assets/images/Left.png"
									style="width: 80px; display: inline-block; float: left;">
								</a>
							</p>
							<p class="col-md-4"></p>
							<p class="col-md-4">
								<a class="showSingle" target="5">
									<img alt="next"
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
	<div class="targetDiv" id="div5" style="display: none">
		<div class="banner-caption">
			<div class="container">
				<div class="row">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-2 text-center"
							data-animation-effect="fadeIn">
							<h1 class="text-center" style="font-size: 50px">
								<span style="font-size: 50px; color: teal;">Q5</span> 1장의 사진을
								골라주세요.
							</h1>
							<p class="lead text-center"></p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group" id="q5">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref5"> <input id="q5-1"
								type="radio" name="usrPref5" value="1" /> <img
								src="${pageContext.request.contextPath }/assets/images/swim.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref5"> <input id="q5-2"
								type="radio" name="usrPref5" value="2" /> <img
								src="${pageContext.request.contextPath }/assets/images/skydiving.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref5"> <input id="q5-3"
								type="radio" name="usrPref5" value="3" /> <img
								src="${pageContext.request.contextPath }/assets/images/Paragliding.jpg"
								style="width: 250px">
							</label>
						</div>
						<div class="col-md-12" data-animation-effect="fadeIn">
							<label class="col-sm-6 col-md-4" for="usrPref5"> <input id="q5-4"
								type="radio" name="usrPref5" value="4" /> <img
								src="${pageContext.request.contextPath }/assets/images/mountain_bike.jpg"
								style="width: 250px"></label>
							<label class="col-sm-6 col-md-4" for="usrPref5"> <input id="q5-5"
								type="radio" name="usrPref5" value="5" /> <img
								src="${pageContext.request.contextPath }/assets/images/biking_racing.jpg"
								style="width: 250px">
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12" data-animation-effect="fadeIn">
							<p class="col-md-4">
								<a class="showSingle" target="4">
									<img alt="pre"
									src="${pageContext.request.contextPath }/assets/images/Left.png"
									style="width: 80px; display: inline-block; float: left;">
								</a>
							</p>
							<p class="col-md-4"></p>
							<p class="col-md-4">
								
									<img alt="next" class="menu_links"
									src="${pageContext.request.contextPath }/assets/images/Right.png"
									style="width: 80px; display: inline-block; float: right;" id="survey-submit" >
						
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<div class="buttons" style="display: none">
		<!-- <a  id="showall">All</a> -->
		<a  class="showSingle" target="1" >Div 1</a>
		<a  class="showSingle" target="2">Div 2</a>
		<a  class="showSingle" target="3">Div 3</a>
		<a  class="showSingle" target="4">Div 4</a>
	</div>
</body>
</html>