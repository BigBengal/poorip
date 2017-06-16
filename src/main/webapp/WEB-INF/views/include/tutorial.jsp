<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" id="contents" data-spy="scroll"
	data-target="#myScrollspy" data-offset="20">
	<div class="col-sm-12">
		<div class="col-sm-3" id="myScrollspy">
			<ul class="dropdown">
				<li class="dropdown"><a class="active dropdown-toggle"
					data-toggle="dropdown" href="#travel">여행방법 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#section41">여행방법-1</a></li>
						<li><a href="#section42">여행방법-2</a></li>
					</ul></li>
				<li class="dropdown"><a class="active dropdown-toggle"
					data-toggle="dropdown" href="#matching">matching 방법<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#section41">matching 방법-1</a></li>
						<li><a href="#section42">matching 방법-2</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="col-sm-9">
			<!-- 여행 정보 설명 -->
			<div class="col-md-12" id="travel">
				<div class="col-md-12"
					style="border: solid lightskyblue 1.5px; border-radius: 8px; margin-bottom: 20px;">
					<div class="col-md-12">
						<h3>
							<span style="font-family: 'Kaushan Script', cursive;">TraveInfo</span>
						</h3>
					</div>
					<div class="col-md-12" style="padding: 0">
						<img alt="메인 화면 네비게이션"
							src="${pageContext.request.contextPath }/assets/images/tutorial1.png">
					</div>
					<div class="col-md-12 text-center"
						style="border: solid 1px lightgray; width: 100%; padding: 0; margin-top: 10px; margin-bottom: 20px;">
						<p>유럽 여행을 계획할때 유용하게 사용할수 있는 페이지 입니다.</p>
					</div>
				</div>
				<!--         <h1>Section 1</h1> -->
				<!--         <p>Try to scroll this section and look at the navigation list while scrolling!</p> -->
			</div>
			<!-- 매칭 방법 설명 -->
			<div class="col-md-12" id="matching">
				<div class="col-md-8">
					<div class="col-md-12">
						<h3>
							<span>TraveInfo</span>
						</h3>
					</div>
					<div class="col-md-12">
						<img alt="메인 화면 네비게이션"
							src="${pageContext.request.contextPath }/assets/images/tutorial1.png">
					</div>
				</div>
				<div class="col-md-4">
					<p>TraveInfo</p>
				</div>
			</div>
		</div>
	</div>
</div>