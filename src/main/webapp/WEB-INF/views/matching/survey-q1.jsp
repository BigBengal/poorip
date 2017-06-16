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
	<div id="banner" class="banner" style="opacity: 0.5;">
		<img
			src="${pageContext.request.contextPath}/assets/images/wallpaper5.jpg"
			style="width: 100%; object-fit: cover; height: 100%;">
		<div class="backstretch"></div>
	</div>
	<form id="survey-form"
		action="${pageContext.request.contextPath }/matching/updatePrefer">
		<!-- banner end -->
		<div class="targetDiv" id="div1">
			<div class="survey-contents">
				<div class="container">
					<div class="row">
						<div class="form-group">
							<div class="col-md-8 col-md-offset-2 text-center surveyqtitle"
								data-animation-effect="fadeIn" style="width: 80%; margin-left: 10%;">
								<h1 class="text-center" style="font-size: 50px">
									<span style="font-size: 50px; color: teal;">Q1</span> 당신은 어떤 타입의 여행자인가요?
								</h1>
								<p class="lead text-center"></p>
							</div>
						</div>
					</div>
					<div class="row">
						<a href="${pageContext.request.contextPath }/matching/survey" class="showLeft" > <img alt="next" alt="prev"
							src="${pageContext.request.contextPath }/assets/images/backpage.png"
							style="width: 80px; display: inline-block; float: right;">
						</a>
						<a class="showSingle" target="2"> <img alt="next"
							src="${pageContext.request.contextPath }/assets/images/nextpage.png"
							style="width: 80px; display: inline-block; float: right;">
						</a>

						<div class="form-group" id="q1">
							<div class="col-md-12 surveyQ" id="surveyQ1"
								data-animation-effect="fadeIn" style="margin-left:40px;">
								<label class="col-sm-6 col-md-3" for="q1-1"> <input
									id="q1-1" type="radio" name="usrPref1" value="A" /> <img
									src="${pageContext.request.contextPath }/assets/images/group.png"
									style="width: 250px"></label> <label class="col-sm-6 col-md-3"
									for="q1-2"> <input id="q1-2" type="radio"
									name="usrPref1" value="B" /> <img
									src="${pageContext.request.contextPath }/assets/images/indiv.png"
									style="width: 250px"></label> <label class="col-sm-6 col-md-3"
									for="q1-3"> <input id="q1-3" type="radio"
									name="usrPref1" value="C" /> <img
									src="${pageContext.request.contextPath }/assets/images/advent.png"
									style="width: 250px">
								</label>
								<label class="col-sm-6 col-md-3" for="q1-4" style="padding-right: 40px;"> <input
									id="q1-4" type="radio" name="usrPref1" value="D" /> <img
									src="${pageContext.request.contextPath }/assets/images/alone.png"
									style="width: 250px; height:480px; object-fit:contain;"></label>
								
							</div>
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- banner end -->
		<div class="targetDiv" id="div2" style="display: none">
			<div class="survey-contents">
				<div class="container">
					<div class="row">

						<div class="form-group">
							<div class="col-md-8 col-md-offset-2 text-center surveyqtitle"
								data-animation-effect="fadeIn">
								<h1 class="text-center" style="font-size: 50px">
									<span style="font-size: 50px; color: teal;">Q2</span> 어떤 손모양과 맞으시나요?
								</h1>
								<p class="lead text-center"></p>
							</div>
						</div>
					</div>
					<div class="row">
						<a class="showLeft" target="1"> <img alt="pre"
							src="${pageContext.request.contextPath }/assets/images/backpage.png"
							style="width: 80px; display: inline-block; float: left;">
						</a> <a class="showSingle" target="3"> <img alt="next"
							src="${pageContext.request.contextPath }/assets/images/nextpage.png"
							style="width: 80px; display: inline-block; float: right;">
						</a>
						<div class="form-group " id="q2">
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								<label class="col-sm-6 col-md-4" for="q2-1"> <input
									id="q2-1" type="radio" name="usrPref2" value="A" /> <img
									src="${pageContext.request.contextPath }/assets/images/brain_test1.png"
									style="width: 200px"></label> <label class="col-sm-6 col-md-4"
									for="q2-2"> <input id="q2-2" type="radio"
									name="usrPref2" value="B" /> <img
									src="${pageContext.request.contextPath }/assets/images/brain_test2.png"
									style="width: 200px"></label> <label class="col-sm-6 col-md-4"
									for="q2-3"> <input id="q2-3" type="radio"
									name="usrPref2" value="C" /> <img
									src="${pageContext.request.contextPath }/assets/images/brain_test3.png"
									style="width: 200px">
								</label>
							</div>
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								<label class="col-sm-6 col-md-4" for="q2-4"> <input
									id="q2-4" type="radio" name="usrPref2" value="D" /> <img
									src="${pageContext.request.contextPath }/assets/images/brain_test4.png"
									style="width: 200px"></label> <label class="col-sm-6 col-md-4"
									for="q2-5"> <input id="q2-5" type="radio"
									name="usrPref2" value="E" /> <img
									src="${pageContext.request.contextPath }/assets/images/brain_test5.png"
									style="width: 200px"></label><label class="col-sm-6 col-md-4"
									for="q2-6"> <input id="q2-6" type="radio"
									name="usrPref2" value="F" /> <img
									src="${pageContext.request.contextPath }/assets/images/brain_test6.png"
									style="width: 200px">
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- banner end -->
		<div class="targetDiv" id="div3" style="display: none">
			<div class="survey-contents">
				<div class="container">
					<div class="row">
						<div class="form-group">
							<div class="col-md-8 col-md-offset-2 text-center surveyqtitle"
								data-animation-effect="fadeIn" style="margin-bottom: 5px;">
								<h1 class="text-center" style="font-size: 38px">
									<span style="font-size: 50px; color: teal;">Q3</span> 아래의 사진 속 여자에 대한 당신의 느낌을 
									골라주세요.
								</h1>
								<img src="${pageContext.request.contextPath }/assets/images/test3_image.jpg" style="margin: auto;">
								<p class="lead text-center"></p>
							</div>
						</div>
					</div>
					<div class="row">
						<a class="showLeft" target="2"> <img alt="pre"
							src="${pageContext.request.contextPath }/assets/images/backpage.png"
							style="width: 80px; display: inline-block; float: left;">
						</a> <a class="showSingle" target="4"> <img alt="next"
							src="${pageContext.request.contextPath }/assets/images/nextpage.png"
							style="width: 80px; display: inline-block; float: right;">
						</a>
						<div class="form-group" id="q3">
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								<label class="col-sm-6 col-md-4" for="q3-1"><input
									id="q3-1" type="radio" name="usrPref3" value="A" /> <img
									src="${pageContext.request.contextPath }/assets/images/test3-1.png"
									style="width: 220px"></label> 
								<label class="col-sm-6 col-md-4"
									for="q3-2"> <input id="q3-2" type="radio"
									name="usrPref3" value="B" /><img
									src="${pageContext.request.contextPath }/assets/images/test3-2.png"
									style="width: 220px"></label> 
								<label class="col-sm-6 col-md-4"
									for="q3-3"> <input id="q3-3" type="radio"
									name="usrPref3" value="C" /><img
									src="${pageContext.request.contextPath }/assets/images/test3-3.png"
									style="width: 220px">
								</label>
							</div>
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								<label class="col-sm-6 col-md-4" for="q3-4"> <input
									id="q3-4" type="radio" name="usrPref3" value="D" /><img
									src="${pageContext.request.contextPath }/assets/images/test3-4.png"
									style="width: 220px"></label> <label class="col-sm-6 col-md-4"
									for="q3-5"> <input id="q3-5" type="radio"
									name="usrPref3" value="E" /><img
									src="${pageContext.request.contextPath }/assets/images/test3-5.png"
									style="width: 220px">
								</label>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="targetDiv" id="div4" style="display: none">
			<div class="survey-contents">
				<div class="container">
					<div class="row">
						<div class="form-group">
							<div class="col-md-8 col-md-offset-2 text-center surveyqtitle"
								data-animation-effect="fadeIn">
								<h1 class="text-center" style="font-size: 50px">
									<span style="font-size: 50px; color: teal;">Q4</span> 눈앞에 여러가지 물건이 있습니다. <br>제일먼저 잡고 싶은 물건은?
								</h1>
								<p class="lead text-center"></p>
							</div>
						</div>
					</div>
					<div class="row">
						<a class="showLeft" target="3"> <img alt="pre"
							src="${pageContext.request.contextPath }/assets/images/backpage.png"
							style="width: 80px; display: inline-block; float: left;">
						</a> <a class="showSingle" target="5"> <img alt="next"
							src="${pageContext.request.contextPath }/assets/images/nextpage.png"
							style="width: 80px; display: inline-block; float: right;">
						</a>
						<div class="form-group" id="q4">
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								<label class="col-sm-6 col-md-4" for="q4-1"> <input
									id="q4-1" type="radio" name="usrPref4" value="A" /> <img
									src="${pageContext.request.contextPath }/assets/images/fruit.jpg"
									style="width: 250px; height: 180px;"></label> <label class="col-sm-6 col-md-4"
									for="q4-2"> <input id="q4-2" type="radio"
									name="usrPref4" value="B" /> <img
									src="${pageContext.request.contextPath }/assets/images/Mochi.png"
									style="width: 250px; height: 180px;"></label> <label class="col-sm-6 col-md-4"
									for="q4-3"> <input id="q4-3" type="radio"
									name="usrPref4" value="C" /> <img
									src="${pageContext.request.contextPath }/assets/images/CrystalBall.jpg"
									style="width: 250px; height: 180px;">
								</label>
							</div>
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								<label class="col-sm-6 col-md-4" for="q4-4"> <input
									id="q4-4" type="radio" name="usrPref4" value="D" /> <img
									src="${pageContext.request.contextPath }/assets/images/Cash.jpg"
									style="width: 250px; height: 180px;"></label> <label class="col-sm-6 col-md-4"
									for="q4-5"> <input id="q4-5" type="radio"
									name="usrPref4" value="E" /> <img
									src="${pageContext.request.contextPath }/assets/images/Ring.png"
									style="width: 250px; height: 180px;">
								</label>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="targetDiv" id="div5" style="display: none">
			<div class="survey-contents">
				<div class="container">
					<div class="row">
						<div class="form-group">
							<div class="col-md-8 col-md-offset-2 text-center surveyqtitle"
								data-animation-effect="fadeIn">
								<h1 class="text-center" style="font-size: 50px">
									<span style="font-size: 50px; color: teal;">Q5</span> 내가 제~일 좋아하는 핸드폰 브랜드는?
								</h1>
								<p class="lead text-center"></p>
							</div>
						</div>
					</div>
					<div class="row">
						<a class="showLeft" target="4"> <img alt="pre"
							src="${pageContext.request.contextPath }/assets/images/backpage.png"
							style="width: 80px; display: inline-block; float: left;">
						</a>
						<a class="showSingle" target="6"><img class="menu_links" alt="next" id="survey-submit"
							src="${pageContext.request.contextPath }/assets/images/nextpage.png"
							style="width: 80px; display: inline-block; float: left;">
						</a>
						<div class="form-group" id="q5">
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								<label class="col-sm-6 col-md-4" for="q5-1"> <input
									id="q5-1" type="radio" name="usrPref5" value="A" /> <img
									src="${pageContext.request.contextPath }/assets/images/iphone7_2.png"
									style="width: 250px; height:200px; object-fit:contain;"></label> <label class="col-sm-6 col-md-4"
									for="q5-2"> <input id="q5-2" type="radio"
									name="usrPref5" value="B" /> <img
									src="${pageContext.request.contextPath }/assets/images/galaxys8_2.png"
									style="width: 250px; height:200px; padding:15px; object-fit:contain;"></label> <label class="col-sm-6 col-md-4"
									for="q5-3"> <input id="q5-3" type="radio"
									name="usrPref5" value="C" /> <img 
									src="${pageContext.request.contextPath }/assets/images/huawei_2.png"
									style="width: 250px; height:200px; object-fit:contain;">
								</label>
							</div>
							<div class="col-md-12 surveyQ" data-animation-effect="fadeIn">
								<label class="col-sm-6 col-md-4" for="q5-4"> <input
									id="q5-4" type="radio" name="usrPref5" value="D" /> <img
									src="${pageContext.request.contextPath }/assets/images/pixelxl_2.png"
									style="width: 250px; height:200px; object-fit:contain;"></label> <label class="col-sm-6 col-md-4"
									for="q5-5"> <input id="q5-5" type="radio"
									name="usrPref5" value="E" /> <img 
									src="${pageContext.request.contextPath }/assets/images/lumia_2.png"
									style="width: 250px; height:200px; object-fit:contain;">
								</label>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		
	</form>
	<div class="targetDiv" id="div6" style="display: none;">
<div class="progress">
<div class="survey-contents">
				<div class="container loadingcontents">
  <img src="${pageContext.request.contextPath }/assets/images/loading3.gif" style="z-index:100; width:90%; heigh:100%; margin-left:5%;">
  </div>
  </div>
</div>
		</div>
</body>
</html>