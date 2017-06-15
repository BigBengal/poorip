<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${!empty cityName }">
		<h1 class="text-center title" id="portfolio">${cityName.ctyName} 여행 정보</h1>
	</c:when>
	<c:otherwise>
		<h1 class="text-center title" id="portfolio">유럽 여행 정보</h1>	
	</c:otherwise>
</c:choose>

<div class="separator"></div>
<p class="lead text-center">
	유익한 여행정보를 한 공간에 모아놨습니다.<br> 당신의 여행에 도움이 되길 바랍니다.
</p>
<br>

<form id="travel_search" action="${pageContext.request.contextPath}/searchResult" method="get"
	style="text-align: center">
	<input type="text"
		style="margin-bottom: 20px; display: inline-block; width: 75%"
		placeholder="Search any countries or cities" class="form-control" id="city-kwd"
		name="ctySeq" value="${cityName.ctyName}">
	<a id="searchshowall" class="ui-button ui-widget ui-corner-right ui-button-icon-only" 
		style="height: 34px; left: -6px; position: relative; top: -1px;">
    	<span class="ui-icon ui-icon-triangle-1-s"></span> Button with icon only
 	</a>
	<input type="submit" value="Search" 
		style="display: inline-block; width: 10%; height:34px; float: right; margin-right: 5%">
</form>

<div class="row">
	<div class="col-md-12">
		<span> Hot한 도시 </span> <span id="citymore" class="menu_links" style="font-size: x-small"> ... more </span>
	</div>
	<div id="citylist" class="col-md-12" style="padding-bottom: 25px;">
	<c:if test="${!empty travelInfoCityMain }">
				<c:forEach var="travelInfoCityMain" items="${travelInfoCityMain }"
					varStatus="status">
					
					<div class="col-sm-3 col-md-2 margin_up_down<c:if test="${status.index > 5 }"> object_hide </c:if>">
						<div class="image-box">
							<div class="city-overlay-container">
								<img src="/poorip/${travelInfoCityMain.picture}" alt=""> 
									<a class="overlay" data-toggle="modal"
									data-target="#project-1${status.index }"> 
										<i class="fa fa-search-plus"></i> <span>${travelInfoCityMain.name}</span>
									</a>
							</div>
							<a class="btn btn-default btn-block btn-small<c:if test="${travelInfoCityMain.name == cityName.ctyName}"> selected </c:if>" data-toggle="modal"
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
									<div class="modal-body trvinfoname">
										<h2>${travelInfoCityMain.name}</h2>
										<div class="row">
											<div class="col-md-6">
												<p class="trvinfocontent">${travelInfoCityMain.contents}</p>
											</div>

											<div class="col-md-6">
												<img src="/poorip/${travelInfoCityMain.picture}" alt="">
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-sm btn-default"
											id="citygo" data-ctyseq="${travelInfoCityMain.ctySeq}">Search</button>
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
</div>
<div class="row object-non-visible" data-animation-effect="fadeIn">
	<div class="col-md-12">
		<!-- isotope filters start -->
		<div class="filters text-center">
			<ul class="nav nav-pills">
				<c:if test="${!empty travelInfoActivityMain }">
<!-- 					<li class="active"><a href="#" data-filter=".cities"">Hot한 도시</a></li> -->
					<li><a href="#" data-filter=".web-design">Delicious한 맛집</a></li>
					<li><a href="#" data-filter=".app-development">Attractive한 관광지</a></li>
					<li><a href="#" data-filter=".site-building">Fun한 엑티비티</a></li>
				</c:if>
<%-- 				<c:if test="${empty travelInfoCityMain }"> --%>
<!-- 					<li class="active"><a href="#" data-filter=".cities" -->
<!-- 						style="display: none" data-show="N">Hot한 도시</a></li> -->
<%-- 				</c:if> --%>

				<c:if test="${!empty travelInfoFood }">
					<li class="active"><a href="#" data-filter=".web-design">Delicious한
							맛집</a></li>
				</c:if>

				<c:if test="${!empty travelInfoAttraction }">
					<li><a href="#" data-filter=".app-development">Attractive한
							관광지</a></li>
				</c:if>
				<c:if test="${!empty travelInfoActivity }">
					<li><a href="#" data-filter=".site-building">Fun한 엑티비티</a></li>
				</c:if>
			</ul>
		</div>
		<!-- isotope filters end -->


		<!-- portfolio items start -->

		<!-- cities 가 맛집임 -->

		<div class="isotope-container row grid-space-20">
			
			<c:if test="${!empty travelInfoFood }">
				<c:forEach var="travelInfoFood" items="${travelInfoFood }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item web-design">
						<div class="image-box">
							<div class="overlay-container">
								<div style="position: absolute;top: 10px;left: 10px; z-index:1;">
								<c:if test="${travelInfoFood.recmdBlog >= 1}"><div class="recmd_blog1" title="블로그 검색 추천"></div></c:if>
								<c:if test="${travelInfoFood.recmdEmoj >= 1}"><div class="recmd_emoj1" title="감정 분석 추천"></div></c:if>
								<c:if test="${travelInfoFood.recmdTripAd >= 1}"><div class="recmd_trip1" title="트립어드바이저 추천"></div></c:if>
								</div>
								<img src="/poorip/${travelInfoFood.picture}" alt=""> <a
									class="overlay" data-toggle="modal"
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
										<h2 class="trvinfo">
											<b>${travelInfoFood.name}</b>
										</h2>
										
											<div class="col-md-5">
												<p class="trvinfocontent">${travelInfoFood.contents}</p>
											</div>
											<div class="col-sm-12 col-md-7" id="travelPic-${travelInfoFood.trvSeq}" style="min-height:400px; padding: 0px;">
												<img src="/poorip/${travelInfoFood.picture}" alt="" />
											</div>
											<div class="col-sm-12 col-md-6 detail">
												<h3 class="trvinfo">영업시간</h3>
												<p>${travelInfoFood.hours}</p>
											</div>
											<div class="col-sm-12 col-md-6 detail">
												<h3 class="trvinfo">가격</h3>
												<p>${travelInfoFood.price}</p>
											</div>
											<div class="col-sm-12 col-md-6 detail">
												<h3 class="trvinfo">연락 정보</h3>
												<p>${travelInfoFood.contact}</p>
											</div>
											<div class="col-sm-12 col-md-6 detail">
												<h3 class="trvinfo">주소</h3>
												<p>${travelInfoFood.location}</p>
											</div>
											
									
										<div class="row">
											<div class="col-md-12">
												<h5 class="trvinfo modalmap">위치 확인</h5>
												<!--  구글 맵 넣기   -->
												<div id="map-project-2${status.index}"
													class="col-sm-12 col-md-12 googlemap"
													data-url="${travelInfoFood.mapURL}"></div>
											</div>
										</div>
										<c:set var="reviewNum" value="${travelInfoFood.trvSeq}" />
										<div class='col-md-12'>
											<div class='review-header'>
												<h3>
													<b>후기</b>
												</h3>
												<div class="btn-group col-sm-6"
													style="margin-bottom: 1.5em; float: right"
													data-toggle="buttons">


													<label class="btn btn-default active" id="notiY"
														onClick="send(${travelInfoFood.trvSeq},${travelInfoFood.trvSeq})">
														<input type="radio" name="sort-by" value="date"
														id="sort-by-btn " value="" checked> 날짜순
													</label> <label class="btn btn-default " id="notiN"
														onClick="sendTrvSeq1(${travelInfoFood.trvSeq})"> <input
														type="radio" name="sort-by" value="like" id="sort-by-btn">
														좋아요순
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
								<div style="position: absolute;top: 10px;left: 10px; z-index:1;">
								<c:if test="${travelInfoFoodMain.recmdBlog >= 1}"><div class="recmd_blog1" title="블로그 검색 추천"></div></c:if>
								<c:if test="${travelInfoFoodMain.recmdEmoj >= 1}"><div class="recmd_emoj1" title="감정 분석 추천"></div></c:if>
								<c:if test="${travelInfoFoodMain.recmdTripAd >= 1}"><div class="recmd_trip1" title="트립어드바이저 추천"></div></c:if>
								</div>
								<img src="/poorip/${travelInfoFoodMain.picture}" alt=""> <a
									class="overlay" data-toggle="modal"
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
										<h2 class="trvinfo">${travelInfoFoodMain.name}</h2>

										<div class="col-md-5">
											<p class="trvinfocontent">${travelInfoFoodMain.contents}</p>
										</div>
										<div class="col-sm-12 col-md-7" id="travelPic-${travelInfoFoodMain.trvSeq}" style="min-height:400px; padding: 0px;">
											<img src="/poorip/${travelInfoFoodMain.picture}" alt="">
										</div>
										<div class="col-sm-12 col-md-6 detail">
											<h3 class="trvinfo">영업시간</h3>
											<p>${travelInfoFoodMain.hours}</p>
										</div>
										<div class="col-sm-12 col-md-6 detail">
											<h3 class="trvinfo">가격</h3>
											<p>${travelInfoFoodMain.price}</p>
										</div>
										<div class="col-sm-12 col-md-6 detail">
											<h3 class="trvinfo">연락 정보</h3>
											<p>${travelInfoFoodMain.contact}</p>
										</div>
										
										<div class="col-sm-12 col-md-6 detail">
											<h3 class="trvinfo">주소</h3>
											<p>${travelInfoFoodMain.location}</p>
										</div>
										
										<div class="row">
											<div class="col-md-12 googlemapdiv">
												<h5 class="trvinfo modalmap">위치 확인</h5>
												<!--  구글 맵 넣기   -->
												<div id="map-project-3${status.index}"
													class="col-md-12 googlemap mapinmodal"
													data-url="${travelInfoFoodMain.mapURL}"></div>
											</div>
										</div>

										<c:set var="reviewNum" value="${travelInfoFoodMain.trvSeq}" />
										<div class='col-md-12'>
											<div class='review-header'>
												<h3>
													<b>후기</b>

												</h3>
												<div class="btn-group col-sm-6"
													style="margin-bottom: 1.5em; float: right"
													data-toggle="buttons">


													<label class="btn btn-default active"
														onClick="send(${travelInfoFoodMain.trvSeq},${travelInfoFoodMain.trvSeq})">
														<input type="radio" name="sort-by-date" value="date"
														id="sort-by-date-btn=${travelInfoFoodMain.trvSeq }"
														autocomplete="off" /> 날짜순
													</label> <label class="btn btn-default "
														onClick="sendTrvSeq1(${travelInfoFoodMain.trvSeq})">
														<input type="radio" name="sort-by-like" value="like"
														id="sort-by-like-btn" autocomplete="off" /> 좋아요순
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
								<div style="position: absolute;top: 10px;left: 10px; z-index:1;">
								<c:if test="${travelInfoAttraction.recmdBlog >= 1}"><div class="recmd_blog1" title="블로그 검색 추천"></div></c:if>
								<c:if test="${travelInfoAttraction.recmdEmoj >= 1}"><div class="recmd_emoj1" title="감정 분석 추천"></div></c:if>
								<c:if test="${travelInfoAttraction.recmdTripAd >= 1}"><div class="recmd_trip1" title="트립어드바이저 추천"></div></c:if>
								</div>
								<img src="/poorip/${travelInfoAttraction.picture}" alt="">
								<a class="overlay" data-toggle="modal"
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

										<h2 class="trvinfo">${travelInfoAttraction.name}</h2>
									
											<div class="col-md-5">
												<p class="trvinfocontent">${travelInfoAttraction.contents}</p>
											</div>
											<div class="col-sm-12 col-md-7" id="travelPic-${travelInfoAttraction.trvSeq}" style="min-height:400px; padding: 0px;">
												<img src="/poorip/${travelInfoAttraction.picture}" alt="">
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">영업시간</h3>
												<p>${travelInfoAttraction.hours}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">가격</h3>
												<p>${travelInfoAttraction.price}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">연락 정보</h3>
												<p>${travelInfoAttraction.contact}</p>
											</div>
											
											<div class="col-md-6 detail">
												<h3 class="trvinfo">주소</h3>
												<p>${travelInfoAttraction.location}</p>
											</div>
											<div class="row">
												<div class="col-md-12">
													<h5 class="trvinfo modalmap">위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-4${status.index}"
														class="col-md-12 googlemap"
														data-url="${travelInfoAttraction.mapURL}"></div>
												</div>
											</div>
											<c:set var="reviewNum" value="${travelInfoAttraction.trvSeq}" />
											<div class='col-md-12'>
												<div class='review-header'>
													<h3>
														<b>후기</b>

													</h3>
													<div class="btn-group col-sm-6"
														style="margin-bottom: 1.5em; float: right"
														data-toggle="buttons">


														<label class="btn btn-default active"
															onClick="send(${travelInfoAttraction.trvSeq},${travelInfoAttraction.trvSeq})">
															<input type="radio" name="sort-by-date" value="date"
															id="sort-by-date-btn=${travelInfoAttraction.trvSeq }"
															autocomplete="off" /> 날짜순
														</label> <label class="btn btn-default "
															onClick="sendTrvSeq1(${travelInfoAttraction.trvSeq})">
															<input type="radio" name="sort-by-like" value="like"
															id="sort-by-like-btn" autocomplete="off" /> 좋아요순
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
								<div style="position: absolute;top: 10px;left: 10px; z-index:1;">
								<c:if test="${travelInfoAttractionMain.recmdBlog >= 1}"><div class="recmd_blog1" title="블로그 검색 추천"></div></c:if>
								<c:if test="${travelInfoAttractionMain.recmdEmoj >= 1}"><div class="recmd_emoj1" title="감정 분석 추천"></div></c:if>
								<c:if test="${travelInfoAttractionMain.recmdTripAd >= 1}"><div class="recmd_trip1" title="트립어드바이저 추천"></div></c:if>
								</div>
								<img src="/poorip/${travelInfoAttractionMain.picture}" alt="">
								<a class="overlay" data-toggle="modal"
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
												id="scrapTrvInfo-${travelInfoAttractionMain.trvSeq}" src=""
												style="float: right;"
												data-trvSeq="${travelInfoAttractionMain.trvSeq}"
												onclick="validate(${travelInfoAttractionMain.trvSeq})" /></a>
										</c:if>
										<h2 class="trvinfo">${travelInfoAttractionMain.name}</h2>
										
											<div class="col-md-5">
												<p class="trvinfocontent">${travelInfoAttractionMain.contents}</p>
											</div>
											<div class="col-sm-12 col-md-7" id="travelPic-${travelInfoAttractionMain.trvSeq}" style="min-height:400px; padding: 0px;">
												<img src="/poorip/${travelInfoAttractionMain.picture}"
													alt="">
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">영업시간</h3>
												<p>${travelInfoAttractionMain.hours}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">가격</h3>
												<p>${travelInfoAttractionMain.price}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">연락 정보</h3>
												<p>${travelInfoAttractionMain.contact}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">주소</h3>
												<p>${travelInfoAttractionMain.location}</p>
											</div>

											<div class="row">
												<div class="col-md-12">
													<h5 class="trvinfo modalmap">위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-5${status.index}"
														class="col-md-12 googlemap"
														data-url="${travelInfoAttractionMain.mapURL}"></div>
												</div>
											</div>

											<c:set var="reviewNum"
												value="${travelInfoAttractionMain.trvSeq}" />
											<div class='col-md-12'>
												<div class='review-header'>
													<h3>
														<b>후기</b>

													</h3>
													<div class="btn-group col-sm-6"
														style="margin-bottom: 1.5em; float: right"
														data-toggle="buttons">


														<label class="btn btn-default active" id="notiY"
															onClick="send(${travelInfoAttractionMain.trvSeq},${travelInfoAttractionMain.trvSeq})">
															<input type="radio" name="sort-by-date" value="date"
															id="sort-by-date-btn=${travelInfoAttractionMain.trvSeq }"
															autocomplete="off" /> 날짜순
														</label> <label class="btn btn-default" id="notiN"
															onClick="sendTrvSeq1(${travelInfoAttractionMain.trvSeq})">
															<input type="radio" name="sort-by-like" value="like"
															id="sort-by-like-btn" autocomplete="off" /> 좋아요순
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
								<div style="position: absolute;top: 10px;left: 10px; z-index:1;">
								<c:if test="${travelInfoActivity.recmdBlog >= 1}"><div class="recmd_blog1" title="블로그 검색 추천"></div></c:if>
								<c:if test="${travelInfoActivity.recmdEmoj >= 1}"><div class="recmd_emoj1" title="감정 분석 추천"></div></c:if>
								<c:if test="${travelInfoActivity.recmdTripAd >= 1}"><div class="recmd_trip1" title="트립어드바이저 추천"></div></c:if>
								</div>
								<img src="/poorip/${travelInfoActivity.picture}" alt=""> <a
									class="overlay" data-toggle="modal"
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
										<h2 class="trvinfo">${travelInfoActivity.name}</h2>
										
											<div class="col-md-5">
												<p class="trvinfocontent">${travelInfoActivity.contents}</p>
											</div>
											<div class="col-sm-12 col-md-7" id="travelPic-${travelInfoActivity.trvSeq}" style="min-height:400px; padding: 0px;">
												<img src="/poorip/${travelInfoActivity.picture}" alt="">
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">영업시간</h3>
												<p>${travelInfoActivity.hours}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">가격</h3>
												<p>${travelInfoActivity.price}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">연락 정보</h3>
												<p>${travelInfoActivity.contact}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">주소</h3>
												<p>${travelInfoActivity.location}</p>
											</div>
											

											<div class="row">
												<div class="col-md-12">
													<h5 class="trvinfo modalmap">위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-6${status.index}"
														class="col-md-12 googlemap"
														data-url="${travelInfoActivity.mapURL}"></div>
												</div>
											</div>

											<c:set var="reviewNum" value="${travelInfoActivity.trvSeq}" />
											<div class='col-md-12'>
												<div class='review-header'>
													<h3>
														<b>후기</b>

													</h3>
													<div class="btn-group col-sm-6"
														style="margin-bottom: 1.5em; float: right"
														data-toggle="buttons">


														<label class="btn btn-default active" id="notiY"
															onClick="send(${travelInfoActivity.trvSeq},${travelInfoActivity.trvSeq})">
															<input type="radio" name="sort-by-date" value="date"
															id="sort-by-date-btn=${travelInfoActivity.trvSeq }"
															autocomplete="off" /> 날짜순
														</label> <label class="btn btn-default " id="notiN"
															onClick="sendTrvSeq1(${travelInfoActivity.trvSeq})">
															<input type="radio" name="sort-by-like" value="like"
															id="sort-by-like-btn" autocomplete="off" /> 좋아요순
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
								<div style="position: absolute;top: 10px;left: 10px; z-index:1;">
								<c:if test="${travelInfoActivityMain.recmdBlog >= 1}"><div class="recmd_blog1" title="블로그 검색 추천"></div></c:if>
								<c:if test="${travelInfoActivityMain.recmdEmoj >= 1}"><div class="recmd_emoj1" title="감정 분석 추천"></div></c:if>
								<c:if test="${travelInfoActivityMain.recmdTripAd >= 1}"><div class="recmd_trip1" title="트립어드바이저 추천"></div></c:if>
								</div>
								<img src="/poorip/${travelInfoActivityMain.picture}" alt="">
								<a class="overlay" data-toggle="modal"
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
										<h2 class="trvinfo">${travelInfoActivityMain.name}</h2>
										
											<div class="col-md-5">
												<p class="trvinfocontent">${travelInfoActivityMain.contents}</p>
											</div>
											<div class="col-sm-12 col-md-7" id="travelPic-${travelInfoActivityMain.trvSeq}" style="min-height:400px; padding: 0px;">
												<img src="/poorip/${travelInfoActivityMain.picture}" alt="">
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">영업시간</h3>
												<p>${travelInfoActivityMain.hours}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">가격</h3>
												<p>${travelInfoActivityMain.price}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">연락 정보</h3>
												<p>${travelInfoActivityMain.contact}</p>
											</div>
											<div class="col-md-6 detail">
												<h3 class="trvinfo">주소</h3>
												<p>${travelInfoActivityMain.location}</p>
											</div>
											

											<div class="row">
												<div class="col-md-12">
													<h5 class="trvinfo modalmap">위치 확인</h5>
													<!--  구글 맵 넣기   -->
													<div id="map-project-7${status.index}"
														class="col-md-12 googlemap"
														data-url="${travelInfoActivityMain.mapURL}"></div>
												</div>
											</div>

											<c:set var="reviewNum"
												value="${travelInfoActivityMain.trvSeq}" />
											<div class='col-md-12'>
												<div class='review-header'>
													<h3>
														<b>후기</b>

													</h3>
													<div class="btn-group col-sm-6"
														style="margin-bottom: 1.5em; float: right"
														data-toggle="buttons">


														<label class="btn btn-default active" id="notiY"
															onClick="send(${travelInfoActivityMain.trvSeq},${travelInfoActivityMain.trvSeq})">
															<input type="radio" name="sort-by-date" value="date"
															id="sort-by-date-btn=${travelInfoActivityMain.trvSeq }"
															autocomplete="off" /> 날짜순
														</label> <label class="btn btn-default" id="notiN"
															onClick="sendTrvSeq1(${travelInfoActivityMain.trvSeq})">
															<input type="radio" name="sort-by-like" value="like"
															id="sort-by-like-btn" autocomplete="off" /> 좋아요순
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
