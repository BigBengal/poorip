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

<form id="travel_search" action="${pageContext.request.contextPath}/searchResult" method="get">
	<input type="text" style="margin-bottom: 1em;" placeholder="Search..."
		class="form-control" id="kwd" name="ctySeq">
	<input type="submit" value="find">
</form>

<div class="row object-non-visible" data-animation-effect="fadeIn">
	<div class="col-md-12">

		<!-- isotope filters start -->
		<div class="filters text-center">
			<ul class="nav nav-pills">
				<c:if test="${!empty travelInfoCityMain }">
					<li class="active"><a href="#" data-filter=".cities" data-show="Y">Hot한
							도시</a></li>
					<li><a href="#" data-filter=".web-design">Delicious한 맛집</a></li>
				</c:if>
				<c:if test="${empty travelInfoCityMain }">
					<li class="active"><a href="#" data-filter=".cities" style="display:none" data-show="N">Hot한
							도시</a></li>
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
							<img
								src="${pageContext.request.contextPath }/assets/images/paris.png"
								alt=""> <a class="overlay" data-toggle="modal"
								data-target="#project-1${status.index }"> <i class="fa fa-search-plus"></i>
							</a>
						</div>
						<a class="btn btn-default btn-block" data-toggle="modal"
							data-target="#project-1${status.index }"> ${travelInfoCityMain.name} </a>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="project-1${status.index }" tabindex="-1" role="dialog"
						aria-labelledby="project-1-label" aria-hidden="true">
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
											<img src="images/portfolio-1.jpg" alt="">
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
			
			<c:if test="${!empty travelInfoFood }">
				<c:forEach var="travelInfoFood" items="${travelInfoFood }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item web-design">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="${pageContext.request.contextPath }/assets/images/paris.png"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-2${status.index }"> <i class="fa fa-search-plus"></i>
									<span>${travelInfoFood.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-2${status.index }">${travelInfoFood.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-2${status.index }" tabindex="-1"
							role="dialog" aria-labelledby="project-2-label${status.index }"
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
										<h2><b>${travelInfoFood.name}</b></h2>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoFood.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="${pageContext.request.contextPath }/assets/images/pool-party2.jpg" alt="">
											</div>
										</div>
										<h3><b>후기</b></h3>
										<c:forEach var="foodReview" items="${foodReview }" varStatus="status">
										<div class="row">
											<div class="col-md-6">
												<p>${foodReview.title }</p>
												<p>${foodReview.contents }</p>
											</div>
											<div class="col-md-3">
												<img src="${pageContext.request.contextPath }/assets/images/pool-party2.jpg" alt="">
											</div>
										</div>
										</c:forEach>
																			
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
			
			<c:if test="${!empty travelInfoFoodMain }">
				<c:forEach var="travelInfoFoodMain" items="${travelInfoFoodMain }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item web-design">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="${pageContext.request.contextPath }/assets/images/paris.png"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-3"> <i class="fa fa-search-plus"></i>
									<span>${travelInfoFoodMain.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-3">${travelInfoFoodMain.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id=project-3 tabindex="-1"
							role="dialog" aria-labelledby="project-3-label"
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
										<h3>${travelInfoFoodMain.name}</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoFoodMain.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="images/portfolio-12.jpg" alt="">
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
			
			
			<c:if test="${!empty travelInfoAttraction }">
				<c:forEach var="travelInfoAttraction"
					items="${travelInfoAttraction }" varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item app-development">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="${pageContext.request.contextPath }/assets/images/paris.png"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-4"> <i class="fa fa-search-plus"></i>
									<span>${travelInfoAttraction.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-4">${travelInfoAttraction.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-4" tabindex="-1"
							role="dialog" aria-labelledby="project-3-label"
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
										<h3>${travelInfoAttraction.name}</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoAttraction.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="images/portfolio-12.jpg" alt="">
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
									src="${pageContext.request.contextPath }/assets/images/paris.png"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-5"> <i class="fa fa-search-plus"></i>
									<span>${travelInfoAttractionMain.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-5">${travelInfoAttractionMain.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-5" tabindex="-1"
							role="dialog" aria-labelledby="project-12-label"
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
										<h3>${travelInfoAttractionMain.name}</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoAttractionMain.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="images/portfolio-12.jpg" alt="">
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
									src="${pageContext.request.contextPath }/assets/images/paris.png"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-6"> <i class="fa fa-search-plus"></i>
									<span>${travelInfoActivity.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-6">${travelInfoActivity.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-6" tabindex="-1"
							role="dialog" aria-labelledby="project-6-label"
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
										<h3>Project Description</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoActivity.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="images/portfolio-10.jpg" alt="">
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
				<c:forEach var="travelInfoActivityMain" items="${travelInfoActivityMain }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item site-building">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="${pageContext.request.contextPath }/assets/images/paris.png"
									alt=""> <a class="overlay" data-toggle="modal"
									data-target="#project-7"> <i class="fa fa-search-plus"></i>
									<span>${travelInfoActivityMain.name}</span>
								</a>
							</div>
							<a class="btn btn-default btn-block" data-toggle="modal"
								data-target="#project-7">${travelInfoActivityMain.name}</a>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="project-7" tabindex="-1"
							role="dialog" aria-labelledby="project-7-label"
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
										<h3>Project Description</h3>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoActivityMain.contents}</p>
											</div>
											<div class="col-md-6">
												<img src="images/portfolio-10.jpg" alt="">
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