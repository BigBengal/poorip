<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1 style="text-align: center; margin-bottom: 50px;" >도시별 스크랩 정보입니다</h1>
<c:if test="${travelDuration ne null }">
<div style="margin-bottom:30px">
<h3 id="travel-date-info" style="text-align:center">${travelDuration.dateFrom } ~ ${travelDuration.dateTo } 총 여행일 수는 ${travelDuration.dateDiff }일 입니다</h3>
</div>
</c:if>
<div style="margin-bottom:30px">
<h3 id="travel-date-info" style="text-align:center"></h3>
</div>
<div class="row object-non-visible" data-animation-effect="fadeIn">
	<div class="col-md-12">
		<div class="filters text-center">
			<!-- 전체일정 버튼 및 날짜 표기 -->
			<ul class="nav nav-pills" style="float: left;">
			<li class="ui-state-default">
					<a href="#" class="ScrapcityName" data-filter=".scrap-all" data-city-name="0">
					<strong>전체일정</strong>
					<div id="entire-period"> &nbsp; 
					<c:if test="${travelDuration ne null }">
						<c:set var = "fromDt" value = "${fn:substring(travelDuration.dateFrom, 5, 11)}" />
						<c:set var = "fromDt" value = "${fn:replace(fromDt, '-', '.')}" />
						<c:set var = "toDt" value = "${fn:substring(travelDuration.dateTo, 5, 11)}" />
						<c:set var = "toDt" value = "${fn:replace(toDt, '-', '.')}" />
						${fromDt} ~ ${toDt}
					</c:if>
					</div> </a>
			</li>
			</ul> 
			<ul id="sortable" class="nav nav-pills">
			<!-- 도시 리스트 -->
				<c:forEach var="cityList" items="${cityList}" varStatus="status">
					<li class="ui-state-default" data-city_pos="${status.index}">
						<a class="ScrapcityName" href="#" data-filter=".scrap-${cityList.ctySeq}" data-city-name="${cityList.ctySeq}">
							<strong>${cityList.ctyName} | ${cityList.ctrName}</strong>
							<!-- 도시의 여행일자 -->
							<div id="scrap-date-info-${cityList.ctySeq }"> &nbsp;
								<c:forEach var="dateList" items="${dateList }">
									<c:if test="${dateList.ctySeq ==cityList.ctySeq}">
										${dateList.dateFrom} ~ ${dateList.dateTo}
									</c:if>
								</c:forEach>
								&nbsp;
							</div>
						</a></li>
				</c:forEach>
			</ul>
		</div>
		<div id="scrapmap" class="nonefloat col-md-12 col-sm-12 googlemap">
		</div>
		<div class="isotope-container grid-space-20">
		<div class="isotope-item scrap-all col-sm-12 col-md-12 text-center" style="margin-top: 20px;">
			<input class="btn btn-small btn-default " type="submit" style="margin-left:20px;"
				value="지도 숨기기" id="scrapMapBtn-0" onclick="showCityMap(0)">
		</div>
<%-- 		${scrapList} --%>
		<!-- 도시별 관광지 리스트 -->
			<c:forEach var="cityList" items="${cityList }" varStatus="status">
<%-- 				<div style="text-align:center; display:block; width:100%;" class="col-sm-6 col-md-3 isotope-item scrap-${cityList.ctySeq}"> --%>
				<div class="text-center col-sm-12 col-md-12 isotope-item scrap-${cityList.ctySeq}">
					<form class="text-center" id="set-date-scrap-${cityList.ctySeq }" method="post">
<!-- 						style="text-align: center; display: inline-block"> -->
						<div class="text-center">
							<label for="from">출발</label> 
							<input type="text" class="fromDatePick" name="dateFrom" id="fromDate-${cityList.ctySeq}" style="color: #000000; border-radius: 10px"> 
							<label for="to" style="margin-left: 5px">도착</label> 
							<input type="text" class="toDatePick" name="dateTo" id="toDate-${cityList.ctySeq}" style="color: #000000; border-radius: 10px; margin-top: 10px">
						</div>
						<div class="text-center" style="margin-top:30px; margin-bottom:30px">
							<input class="btn btn-small btn-default" type="submit"
												value="저장" id="scrapDate-${cityList.ctySeq}" onclick="setDate(${cityList.ctySeq })">
							<input class="btn btn-small btn-default" type="submit" style="margin-left:20px;"
												value="초기화" id="scrapDateRenew-${cityList.ctySeq}" onclick="clearDate(${cityList.ctySeq })">
							<input class="btn btn-small btn-default" type="submit" style="margin-left:20px;"
												value="지도 숨기기" id="scrapMapBtn-${cityList.ctySeq}" onclick="showCityMap(${cityList.ctySeq})">												
						</div>
					</form>
				</div>
				<div class="sortdetail nav">
				<!-- 관광지 -->
				<c:forEach var="scrapList" items="${scrapList }" varStatus="status">
					<c:if test="${cityList.ctyName == scrapList.ctyName or cityList.ctyName eq scrapList.ctyName}">
						<div class="col-sm-6 col-md-3 isotope-item scrap-${cityList.ctySeq}" 
								data-ctyseq="${cityList.ctySeq}" data-trvseq="${scrapList.trvSeq}" 
								data-url="${scrapList.mapURL}" data-catseq="${scrapList.catSeq}">
							
								<div class="image-box">
								<div class="overlay-container">
									<img
										src="/poorip${scrapList.picture }"
										alt=""> <a class="overlay" data-toggle="modal"
										data-target="#project-2${status.index }"
										onclick="send(${scrapList.trvSeq}, ${scrapList.trvSeq})">
										<i class="fa fa-search-plus"></i> <span>${scrapList.name}</span>
									</a>
								</div>

								<a href="#" class="btn btn-default btn-block"
									data-toggle="modal" data-target="#project-2${status.index }"
									onclick="send(${scrapList.trvSeq}, ${scrapList.trvSeq})">${scrapList.name }</a>

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
											<h4 class="modal-title" id="project-2-label${status.index }">${scrapList.name}</h4>
										</div>
										<div class="modal-body">
											<a href="javascript:;"><img
												id="scrapTrvInfo-${scrapList.trvSeq}" src=""
												style="float: right;" data-trvseq="${scrapList.trvSeq}"
												onclick="validate(${scrapList.trvSeq})" /></a>

											<h2>
												<b>${scrapList.name}</b>
											</h2>
											<div class="row">
												<div class="col-md-5">
													<p>${scrapList.contents}</p>
												</div>
												<div class="col-md-7" id="travelPic-${scrapList.trvSeq}" style="min-height:400px; padding: 0px;">
													<img
														src="/poorip${scrapList.picture }"
														alt="" />
												</div>
											</div>
											<div class="col-md-12">
											<h3>위치 확인</h3>
												<div class="row">
													<div id="map-${scrapList.trvSeq}" class="googlemap" data-url="${scrapList.mapURL}"></div>
												</div>
											</div>
											<c:set var="reviewNum" value="${scrapList.trvSeq}" />
											<div class='col-md-12'>
												<h3>
													<b>후기</b>
												</h3>
												<div class="row">
													<div id="review-${scrapList.trvSeq}"></div>
												</div>
												<div class='col-md-3' id="reviewpic-${scrapList.trvSeq}">
													<div id="reviewpic-${scrapList.trvSeq}"></div>
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
<!-- 						</li> -->
						
					</c:if>
				</c:forEach>
</div>

			</c:forEach>
		</div>
	</div>
</div>

