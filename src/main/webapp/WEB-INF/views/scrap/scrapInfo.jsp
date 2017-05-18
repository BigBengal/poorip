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
			<ul class="nav nav-pills">
				<c:forEach var="cityList" items="${cityList }" varStatus="status">
					<li><a  class="ScrapcityName" href="#" data-filter=".scrap-${cityList.ctySeq }" data-city-name="${cityList.ctySeq }"
						style="border: 2px solid #cacaca;"><strong>${cityList.ctyName }</strong></a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="isotope-container row grid-space-20">

			<c:forEach var="cityList" items="${cityList }" varStatus="status">
<%-- 				<div style="text-align:center; display:block; width:100%;" class="col-sm-6 col-md-3 isotope-item scrap-${cityList.ctySeq}"> --%>
				<div class="col-sm-12 col-md-12 isotope-item scrap-${cityList.ctySeq}">
					<form id="set-date-scrap-${cityList.ctySeq }" method="post">
<!-- 						style="text-align: center; display: inline-block"> -->
						<div class="text-center">
							<label for="from">출발</label> 
							<input type="text" class="fromDatePick" name="dateFrom" id="fromDate-${cityList.ctyName }" style="color: #000000; border-radius: 10px"> 
							<label for="to" style="margin-left: 5px">도착</label> 
							<input type="text" class="toDatePick" name="dateTo" id="toDate-${cityList.ctyName }" style="color: #000000; border-radius: 10px; margin-top: 10px">
						</div>
						<div style="margin-top:30px; margin-bottom:30px">
							<input class="btn btn-sm btn-default" type="submit"
												value="저장" id="scrapDate-${cityList.ctySeq }" onclick="setDate(${cityList.ctySeq })">
							<input class="btn btn-sm btn-default" type="submit" style="margin-left:20px;"
												value="초기화" id="scrapDateRenew-${cityList.ctySeq }" onclick="clearDate(${cityList.ctySeq })">
						</div>
					</form>
					
					<c:forEach var="dateList" items="${dateList }" varStatus="status">
					<c:if test="${dateList.ctySeq ==cityList.ctySeq}">
					<div id="scrap-date-info-${cityList.ctySeq }"><div id="city-travel-duration-${cityList.ctySeq }"><h4>${cityList.ctyName} 여행 기간은 ${dateList.dateFrom }  ~ ${dateList.dateTo } 입니다</h4></div></div>
					</c:if>
					</c:forEach>
					<div id="scrap-date-info-${cityList.ctySeq }"></div>
					
				</div>


				<c:forEach var="scrapList" items="${scrapList }" varStatus="status">
					<c:if
						test="${cityList.ctyName == scrapList.ctyName or cityList.ctyName eq scrapList.ctyName}">
						<div class="col-sm-6 col-md-3 isotope-item scrap-${cityList.ctySeq}">


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
												style="float: right;" data-trvSeq="${scrapList.trvSeq}"
												onclick="validate(${scrapList.trvSeq})" /></a>

											<h2>
												<b>${scrapList.name}</b>
											</h2>
											<div class="row">
												<div class="col-md-6">
													<p>${scrapList.contents}</p>
												</div>
												<div class="col-md-6">
													<img
														src="/poorip${scrapList.picture }"
														alt="" />
												</div>
											</div>
											<div class="col-md-12">
											<h3>위치 확인</h3>
												<div class="row">
													<div id="map" class="googlemap" data-url="${scrapList.mapURL}"></div>
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
					</c:if>
				</c:forEach>


			</c:forEach>
		</div>
	</div>
</div>

