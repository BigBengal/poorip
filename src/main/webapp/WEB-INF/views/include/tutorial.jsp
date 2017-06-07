<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container" id="contents">

	<div class="col-md-2">
		<div id="top">
			<p>도움말</p>
			<ul style="list-style:none;">
				<li><a href="#travel"><span>여행방법</span></a></li>
				<li><a href="#matching"><span>matching 방법</span></a></li>
			</ul>
		</div>
	</div>
	
	<!-- 본문 -->
	<div class="col-md-10">
		<!-- 여행 정보 설명 -->
		<div class="col-md-12" id="travel">
			<div class="col-md-12" style="border: solid lightskyblue 1.5px; border-radius: 8px; margin-bottom: 20px;">
				<div class="col-md-12">
					<h3><span style="font-family: 'Kaushan Script', cursive;">TraveInfo</span></h3>
				</div>
				<div class="col-md-12" style="padding: 0">
					<img alt="메인 화면 네비게이션" src="${pageContext.request.contextPath }/assets/images/tutorial1.png">
				</div>
				<div class="col-md-12 text-center" style="border: solid 1px lightgray; width: 100%; padding: 0; margin-top: 10px; margin-bottom: 20px;">
					<p>유럽 여행을 계획할때 유용하게 사용할수 있는 페이지 입니다.</p>
				</div>
			</div>
		</div>
		<!-- 매칭 방법 설명 -->
		<div class="col-md-12" id="matching">
			<div class="col-md-8">
				<div class="col-md-12">
					<h3><span>TraveInfo</span></h3>
				</div>
				<div class="col-md-12">
					<img alt="메인 화면 네비게이션" src="${pageContext.request.contextPath }/assets/images/tutorial1.png">
				</div>
			</div>
			<div class="col-md-4">
				<p>TraveInfo </p>
			</div>
		</div>
	</div>
	
	
</div>