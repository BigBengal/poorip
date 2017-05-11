<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1 class="text-center title" id="portfolio">유럽 여행 정보</h1>
<div class="separator"></div>
<p class="lead text-center">
	유익한 여행정보를 한 공간에 모아놨습니다.<br> 당신의 여행에 도움이 되길 바랍니다.
</p>
<br>

<form id="travel_search"
	action="${pageContext.request.contextPath}/searchResult" method="get"
	style="text-align: center">
	<input type="text" style="margin-bottom: 20px; display: inline-block; width: 90%"
		placeholder="Search..." class="form-control" id="kwd" name="ctySeq">
	<input type="submit" value="find" style="display:inline-block; float:right;">
</form>

<div class="row object-non-visible" data-animation-effect="fadeIn">
	<div class="col-md-12">

		<!-- isotope filters start -->
		<div class="filters text-center">
			<ul class="nav nav-pills">
				<c:if test="${!empty travelInfoCityMain }">
					<li class="active"><a href="#" data-filter=".cities"
						data-show="Y">Hot한 도시</a></li>
					<li><a href="#" data-filter=".web-design">Delicious한 맛집</a></li>
				</c:if>
				<c:if test="${empty travelInfoCityMain }">
					<li class="active"><a href="#" data-filter=".cities"
						style="display: none" data-show="N">Hot한 도시</a></li>
				</c:if>

				<c:if test="${!empty travelInfoFood }">
					<li class="active"><a href="#" data-filter=".web-design">Delicious한
							맛집</a></li>
				</c:if>

				<li><a href="#" data-filter=".app-development">Attractive한
						관광지</a></li>
				<li><a href="#" data-filter=".site-building">Fun한 엑티비티</a></li>
			</ul>
		</div>
		<!-- isotope filters end -->


		<!-- portfolio items start -->

		<!-- cities 가 맛집임 -->

		<div class="isotope-container row grid-space-20">
			<c:if test="${!empty travelInfoCityMain }">
				<c:forEach var="travelInfoCityMain" items="${travelInfoCityMain }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item cities">
						<div class="image-box">
							<div class="overlay-container">
								<img src="/poorip/${travelInfoCityMain.picture}" alt=""> 
								<a class="overlay" data-toggle="modal"
									data-target="#project-1${status.index }">
									 <i	class="fa fa-search-plus"></i>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-1${status.index }">
								${travelInfoCityMain.name} </a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-1${status.index }"
							tabindex="-1" role="dialog" aria-labelledby="project-1-label"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="project-1-label${status.index }">${travelInfoCityMain.name}</h4>
									</div>
									<div class="modal-body">
										<h3>${travelInfoCityMain.name}</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoCityMain.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="/poorip/${travelInfoCityMain.picture}" alt="">
											</div>
										</div>
									</div>
									<div class="modal-footer">
 -										<button type="button" class="btn btn-sm btn-default" id="citygo" data-ctyseq="${travelInfoCityMain.ctySeq}">Search</button>
  										<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
  									</div>
								</div>
							</div>
						</div>
						<!-- Modal end -->
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${!empty travelInfoFood }">
				<c:forEach var="travelInfoFood" items="${travelInfoFood }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item web-design">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="/poorip/${travelInfoFood.picture}"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-2${status.index }"
									onclick="send(${travelInfoFood.trvSeq}, ${travelInfoFood.trvSeq})">
									<i class="fa fa-search-plus"></i> <span>${travelInfoFood.name}</span>
								</a>
							</div>

							<a href="#" class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-2${status.index }"
								onclick="send(${travelInfoFood.trvSeq}, ${travelInfoFood.trvSeq})">${travelInfoFood.name }</a>

						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-2${status.index }"
							tabindex="-1" role="dialog"
							aria-labelledby="project-2-label${status.index }"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="project-2-label${status.index }">${travelInfoFood.name}</h4>
									</div>
									<div class="modal-body">
										<c:if test="${!empty authUser }">
											<a href="javascript:;"><img
												id="scrapTrvInfo-${travelInfoFood.trvSeq}" src=""
												style="float: right;" data-trvSeq="${travelInfoFood.trvSeq}"
												onclick="validate(${travelInfoFood.trvSeq})" /></a>
										</c:if>
										<h2>
											<b>${travelInfoFood.name}</b>
										</h2>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoFood.contents}</p>
											</div>
											<div class="col-md-6">
												<img
													src="/poorip/${travelInfoFood.picture}"
													alt="" />
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<h5>위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-2${status.index}" class="col-md-12 googlemap" data-url="${travelInfoFood.mapURL}"></div>
											</div>
										</div>
										<c:set var="reviewNum" value="${travelInfoFood.trvSeq}" />
										<div class='col-md-12'>	
											<div class='review-header'>
											<h3>
												<b>후기</b>
											</h3>
											<div class="btn-group col-sm-6" style="margin-bottom: 1.5em; float:right"
												data-toggle="buttons">
					
									
												<label class="btn btn-default active" id="notiY" onClick="send(${travelInfoFood.trvSeq},${travelInfoFood.trvSeq})"  > <input
													type="radio" name="sort-by" value="date" id="sort-by-btn "
													 value="" checked> 날짜순
												</label> <label class="btn btn-default " id="notiN" onClick="sendTrvSeq1(${travelInfoFood.trvSeq})"> <input
													type="radio" name="sort-by" value="like" id="sort-by-btn"
													> 좋아요순 
												</label>
								
											</div>
											</div>
											<div class="row">
												<div id="review-${travelInfoFood.trvSeq}"></div>

											</div>
											<div class='col-md-3' id="reviewpic-${travelInfoFood.trvSeq}">
												<div id="reviewpic-${travelInfoFood.trvSeq}"></div>
											</div>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-sm btn-default"
											data-dismiss="modal">화면 닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal end -->
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${!empty travelInfoFoodMain }">
				<c:forEach var="travelInfoFoodMain" items="${travelInfoFoodMain }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item web-design">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="/poorip/${travelInfoFoodMain.picture}"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-3${status.index }"
									onclick="send(${travelInfoFoodMain.trvSeq}, ${travelInfoFoodMain.trvSeq })">
									<i class="fa fa-search-plus"></i> <span>${travelInfoFoodMain.name}</span>
								</a>
							</div>
							<a href="#" class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-3${status.index }"
								onclick="send(${travelInfoFoodMain.trvSeq}, ${travelInfoFoodMain.trvSeq})">
								${travelInfoFoodMain.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-3${status.index}"
							tabindex="-1" role="dialog" aria-labelledby="project-3-label"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="project-3-label">${travelInfoFoodMain.name}</h4>
									</div>
									<div class="modal-body" id="${status.index }">
										<c:if test="${!empty authUser }">
											<a href="javascript:;"><img
												id="scrapTrvInfo-${travelInfoFoodMain.trvSeq}" src=""
												style="float: right;"
												data-trvSeq="${travelInfoFoodMain.trvSeq}"
												onclick="validate(${travelInfoFoodMain.trvSeq})" /></a>
										</c:if>
										<h3>${travelInfoFoodMain.name}</h3>

										<div class="col-md-6">
											<p>${travelInfoFoodMain.contents}</p>
										</div>
										<div class="col-md-6">
											<img
												src="/poorip/${travelInfoFoodMain.picture}"
												alt="">
										</div>
										<div class="row">
											<div class="col-md-12">
												<h5>위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-3${status.index}" class="col-md-12 googlemap" data-url="${travelInfoFoodMain.mapURL}"></div>
											</div>
										</div>
										
										<c:set var="reviewNum" value="${travelInfoFoodMain.trvSeq}" />
										<div class='col-md-12'>
											<div class='review-header'>
											<h3>
												<b>후기</b>

											</h3>
											<div class="btn-group col-sm-6" style="margin-bottom: 1.5em; float:right"
												data-toggle="buttons">
					
									
												<label class="btn btn-default active"  onClick="send(${travelInfoFoodMain.trvSeq},${travelInfoFoodMain.trvSeq})" > <input
													type="radio" name="sort-by-date" value="date" id="sort-by-date-btn=${travelInfoFoodMain.trvSeq }"
													autocomplete="off" /> 날짜순
												</label> 
												<label class="btn btn-default "  onClick="sendTrvSeq1(${travelInfoFoodMain.trvSeq})"> <input
													type="radio" name="sort-by-like" value="like" id="sort-by-like-btn"
													autocomplete="off"/> 좋아요순 
												</label>
								
											</div>
											</div>
											<div class="row">
												<div id="review-${travelInfoFoodMain.trvSeq}"></div>
											</div>
											<div class='col-md-3'
												id="reviewpic-${travelInfoFoodMain.trvSeq}">
												<div id="reviewpic-${travelInfoFoodMain.trvSeq}"></div>
											</div>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-sm btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${!empty travelInfoAttraction }">
				<c:forEach var="travelInfoAttraction"
					items="${travelInfoAttraction }" varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item app-development">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="/poorip/${travelInfoAttraction.picture}"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-4${status.index }"
									onclick="send(${travelInfoAttraction.trvSeq}, ${travelInfoAttraction.trvSeq})">
									<i class="fa fa-search-plus"></i> <span>${travelInfoAttraction.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-4${status.index }"
								onclick="send(${travelInfoAttraction.trvSeq}, ${travelInfoAttraction.trvSeq})">${travelInfoAttraction.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-4${status.index }"
							tabindex="-1" role="dialog" aria-labelledby="project-3-label"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="project-4-label">${travelInfoAttraction.name}</h4>
									</div>
									<div class="modal-body">
										<c:if test="${!empty authUser }">
											<a href="javascript:;"><img
												id="scrapTrvInfo-${travelInfoAttraction.trvSeq}" src=""
												style="float: right;"
												data-trvSeq="${travelInfoAttraction.trvSeq}"
												onclick="validate(${travelInfoAttraction.trvSeq})"></a>
										</c:if>

										<h3>${travelInfoAttraction.name}</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoAttraction.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="/poorip/${travelInfoAttraction.picture}" alt="">
											</div>
											<div class="row">
												<div class="col-md-12">
												<h5>위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-4${status.index}" class="col-md-12 googlemap" data-url="${travelInfoAttraction.mapURL}"></div>
												</div>
											</div>
											<c:set var="reviewNum" value="${travelInfoAttraction.trvSeq}" />
											<div class='col-md-12'>
												<div class='review-header'>
											<h3>
												<b>후기</b>

											</h3>
											<div class="btn-group col-sm-6" style="margin-bottom: 1.5em; float:right"
												data-toggle="buttons">
					
									
												<label class="btn btn-default active" onClick="send(${travelInfoAttraction.trvSeq},${travelInfoAttraction.trvSeq})" > <input
													type="radio" name="sort-by-date" value="date" id="sort-by-date-btn=${travelInfoAttraction.trvSeq }"
													autocomplete="off" /> 날짜순
												</label> <label class="btn btn-default " onClick="sendTrvSeq1(${travelInfoAttraction.trvSeq})"> <input
													type="radio" name="sort-by-like" value="like" id="sort-by-like-btn"
													autocomplete="off"/> 좋아요순 
												</label>
								
											</div>
											</div>
												<div class="row">
													<div id="review-${travelInfoAttraction.trvSeq}"></div>
												</div>
												<div class='col-md-3'
													id="reviewpic-${travelInfoAttraction.trvSeq}">
													<div id="reviewpic-${travelInfoAttraction.trvSeq}"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-sm btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal end -->
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${!empty travelInfoAttractionMain }">
				<c:forEach var="travelInfoAttractionMain"
					items="${travelInfoAttractionMain }" varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item app-development">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="/poorip/${travelInfoAttractionMain.picture}"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-5${status.index }"
									onclick="send(${travelInfoAttractionMain.trvSeq}, ${travelInfoAttractionMain.trvSeq})">
									<i class="fa fa-search-plus"></i> <span>${travelInfoAttractionMain.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-5${status.index }"
								onclick="send(${travelInfoAttractionMain.trvSeq}, ${travelInfoAttractionMain.trvSeq})">${travelInfoAttractionMain.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-5${status.index }"
							tabindex="-1" role="dialog" aria-labelledby="project-12-label"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="project-5-label">${travelInfoAttractionMain.name}</h4>
									</div>
									<div class="modal-body">
										<c:if test="${!empty authUser }">
											<a href="javascript:;"><img
												id="scrapTrvInfo-${travelInfoAttractionMain.trvSeq}"
												src="" style="float: right;"
												data-trvSeq="${travelInfoAttractionMain.trvSeq}"
												onclick="validate(${travelInfoAttractionMain.trvSeq})" /></a>
										</c:if>
										<h3>${travelInfoAttractionMain.name}</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoAttractionMain.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="/poorip/${travelInfoAttractionMain.picture}" alt="">
											</div>
											
											<div class="row">
												<div class="col-md-12">
												<h5>위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-5${status.index}" class="col-md-12 googlemap" data-url="${travelInfoAttractionMain.mapURL}"></div>
												</div>
											</div>
											
											<c:set var="reviewNum"
												value="${travelInfoAttractionMain.trvSeq}" />
											<div class='col-md-12'>
												<div class='review-header'>
											<h3>
												<b>후기</b>

											</h3>
											<div class="btn-group col-sm-6" style="margin-bottom: 1.5em; float:right"
												data-toggle="buttons">
					
									
												<label class="btn btn-default active" id="notiY" onClick="send(${travelInfoAttractionMain.trvSeq},${travelInfoAttractionMain.trvSeq})" > <input
													type="radio" name="sort-by-date" value="date" id="sort-by-date-btn=${travelInfoAttractionMain.trvSeq }"
													autocomplete="off" /> 날짜순
												</label> <label class="btn btn-default" id="notiN" onClick="sendTrvSeq1(${travelInfoAttractionMain.trvSeq})"> <input
													type="radio" name="sort-by-like" value="like" id="sort-by-like-btn"
													autocomplete="off"/> 좋아요순 
												</label>
								
											</div>
											</div>
												<div class="row">
													<div id="review-${travelInfoAttractionMain.trvSeq}"></div>
												</div>
												<div class='col-md-3'
													id="reviewpic-${travelInfoAttractionMain.trvSeq}">
													<div id="reviewpic-${travelInfoAttractionMain.trvSeq}"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-sm btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal end -->
					</div>
				</c:forEach>
			</c:if>


			<c:if test="${!empty travelInfoActivity }">
				<c:forEach var="travelInfoActivity" items="${travelInfoActivity }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item site-building">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="/poorip/${travelInfoActivity.picture}"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-6${status.index }"
									onclick="send(${travelInfoActivity.trvSeq},${travelInfoActivity.trvSeq})">
									<i class="fa fa-search-plus"></i> <span>${travelInfoActivity.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-6${status.index }"
								onclick="send(${travelInfoActivity.trvSeq}, ${travelInfoActivity.trvSeq})">${travelInfoActivity.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-6${status.index }"
							tabindex="-1" role="dialog" aria-labelledby="project-6-label"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="project-6-label">${travelInfoActivity.name}</h4>
									</div>
									<div class="modal-body">
										<c:if test="${!empty authUser }">
											<a href="javascript:;"><img
												id="scrapTrvInfo-${travelInfoActivity.trvSeq}" src=""
												style="float: right;"
												data-trvSeq="${travelInfoActivity.trvSeq}"
												onclick="validate(${travelInfoActivity.trvSeq})" /></a>
										</c:if>
										<h3>${travelInfoActivity.name}</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoActivity.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="/poorip/${travelInfoActivity.picture}" alt="">
											</div>
											
											<div class="row">
												<div class="col-md-12">
												<h5>위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-6${status.index}" class="col-md-12 googlemap" data-url="${travelInfoActivity.mapURL}"></div>
												</div>
											</div>
											
											<c:set var="reviewNum" value="${travelInfoActivity.trvSeq}" />
											<div class='col-md-12'>
												<div class='review-header'>
											<h3>
												<b>후기</b>

											</h3>
											<div class="btn-group col-sm-6" style="margin-bottom: 1.5em; float:right"
												data-toggle="buttons">
					
									
												<label class="btn btn-default active" id="notiY" onClick="send(${travelInfoActivity.trvSeq},${travelInfoActivity.trvSeq})" > <input
													type="radio" name="sort-by-date" value="date" id="sort-by-date-btn=${travelInfoActivity.trvSeq }"
													autocomplete="off" /> 날짜순
												</label> <label class="btn btn-default " id="notiN" onClick="sendTrvSeq1(${travelInfoActivity.trvSeq})"> <input
													type="radio" name="sort-by-like" value="like" id="sort-by-like-btn"
													autocomplete="off"/> 좋아요순 
												</label>
								
											</div>
											</div>
												<div class="row">
													<div id="review-${travelInfoActivity.trvSeq}"></div>
												</div>
												<div class='col-md-3'
													id="reviewpic-${travelInfoActivity.trvSeq}">
													<div id="reviewpic-${travelInfoActivity.trvSeq}"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-sm btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal end -->
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${!empty travelInfoActivityMain }">
				<c:forEach var="travelInfoActivityMain"
					items="${travelInfoActivityMain }" varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item site-building">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="/poorip/${travelInfoActivityMain.picture}"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-7${status.index }"
									onclick="send(${travelInfoActivityMain.trvSeq}, ${travelInfoActivityMain.trvSeq})">
									<i class="fa fa-search-plus"></i> <span>${travelInfoActivityMain.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-7${status.index }"
								onclick="send(${travelInfoActivityMain.trvSeq}, ${travelInfoActivityMain.trvSeq})">${travelInfoActivityMain.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-7${status.index }"
							tabindex="-1" role="dialog" aria-labelledby="project-7-label"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="project-7-label">${travelInfoActivityMain.name}</h4>
									</div>
									<div class="modal-body">
										<c:if test="${!empty authUser }">
											<a href="javascript:;"><img
												id="scrapTrvInfo-${travelInfoActivityMain.trvSeq}" src=""
												style="float: right;"
												data-trvSeq="${travelInfoActivityMain.trvSeq}"
												onclick="validate(${travelInfoActivityMain.trvSeq})" /></a>
										</c:if>
										<h3>${travelInfoActivityMain.name}</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoActivityMain.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="/poorip/${travelInfoActivityMain.picture}" alt="">
											</div>
											
											<div class="row">
												<div class="col-md-12">
												<h5>위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-7${status.index}" class="col-md-12 googlemap" data-url="${travelInfoActivityMain.mapURL}"></div>
												</div>
											</div>
											
											<c:set var="reviewNum"
												value="${travelInfoActivityMain.trvSeq}" />
											<div class='col-md-12'>
												<div class='review-header'>
											<h3>
												<b>후기</b>

											</h3>
											<div class="btn-group col-sm-6" style="margin-bottom: 1.5em; float:right"
												data-toggle="buttons">
					
									
												<label class="btn btn-default active" id="notiY" onClick="send(${travelInfoActivityMain.trvSeq},${travelInfoActivityMain.trvSeq})" > <input
													type="radio" name="sort-by-date" value="date" id="sort-by-date-btn=${travelInfoActivityMain.trvSeq }"
													autocomplete="off" /> 날짜순
												</label> <label class="btn btn-default" id="notiN" onClick="sendTrvSeq1(${travelInfoActivityMain.trvSeq})"> <input
													type="radio" name="sort-by-like" value="like" id="sort-by-like-btn"
													autocomplete="off"/> 좋아요순 
												</label>
								
											</div>
											</div>
												<div class="row">
													<div id="review-${travelInfoActivityMain.trvSeq}"></div>
												</div>
												<div class='col-md-3'
													id="reviewpic-${travelInfoActivityMain.trvSeq}">
													<div id="reviewpic-${travelInfoActivityMain.trvSeq}"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-sm btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal end -->
					</div>
				</c:forEach>
			</c:if>
		</div>
		<!-- portfolio items end -->
	</div>
</div>
