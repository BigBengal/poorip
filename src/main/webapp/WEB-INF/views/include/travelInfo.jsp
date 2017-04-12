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
<div class="row object-non-visible" data-animation-effect="fadeIn">
	<div class="col-md-12">

		<!-- isotope filters start -->
		<div class="filters text-center">
			<ul class="nav nav-pills">
				<li class="active"><a href="#" data-filter=".cities">Hot한
						도시</a></li>
				<li><a href="#" data-filter=".web-design">Delicious한 맛집</a></li>
				<li><a href="#" data-filter=".app-development">Attractive한
						관광지</a></li>
				<li><a href="#" data-filter=".site-building">Fun한 엑티비티</a></li>
			</ul>
		</div>
		<!-- isotope filters end -->


		<!-- portfolio items start -->
		
		<!-- cities 가 맛집임 -->	
		<div class="isotope-container row grid-space-20">
			<div class="col-sm-6 col-md-3 isotope-item cities">
				<div class="image-box">
					<div class="overlay-container">
						<img
							src="${pageContext.request.contextPath }/assets/images/paris.png"
							alt=""> <a class="overlay" data-toggle="modal"
							data-target="#project-1"> <i class="fa fa-search-plus"></i>
						</a>
					</div>
					<a class="btn btn-default btn-block" data-toggle="modal"
						data-target="#project-1"> ${travelInfoList[1].name} </a>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="project-1" tabindex="-1" role="dialog"
					aria-labelledby="project-1-label" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="project-1-label">${travelInfoList[1].name}</h4>
							</div>
							<div class="modal-body">
								<h3>${travelInfoList[1].name}</h3>
								<div class="row">
									<div class="col-md-6">
										<p>${travelInfoList[1].contents}</p>
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
			
			

			<div class="col-sm-6 col-md-3 isotope-item site-building">
				<div class="image-box">
					<div class="overlay-container">
						<img src="images/portfolio-10.jpg" alt=""> <a
							class="overlay" data-toggle="modal" data-target="#project-10">
							<i class="fa fa-search-plus"></i> <span>Site Building</span>
						</a>
					</div>
					<a class="btn btn-default btn-block" data-toggle="modal"
						data-target="#project-10">Project Title</a>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="project-10" tabindex="-1" role="dialog"
					aria-labelledby="project-10-label" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="project-10-label">Project Title</h4>
							</div>
							<div class="modal-body">
								<h3>Project Description</h3>
								<div class="row">
									<div class="col-md-6">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Atque sed, quidem quis praesentium, ut unde. Quae sed,
											incidunt laudantium nesciunt, optio corporis quod earum
											pariatur omnis illo saepe numquam suscipit, nemo placeat
											dignissimos eius mollitia et quas officia doloremque ipsum
											labore rem deserunt vero! Magnam totam delectus accusantium
											voluptas et, tempora quos atque, fugiat, obcaecati
											voluptatibus commodi illo voluptates dolore nemo quo soluta
											quis.</p>
										<p>Molestiae sed enim laboriosam atque delectus voluptates
											rerum nostrum sapiente obcaecati molestias quasi optio
											exercitationem, voluptate quis consequatur libero incidunt,
											in, quod. Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Eos nobis officiis, autem earum tenetur quidem. Quae
											non dicta earum. Ipsum autem eaque cum dolor placeat corporis
											quisquam dolorum at nesciunt.</p>
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

			<div class="col-sm-6 col-md-3 isotope-item web-design">
				<div class="image-box">
					<div class="overlay-container">
						<img src="images/portfolio-11.jpg" alt=""> <a
							class="overlay" data-toggle="modal" data-target="#project-11">
							<i class="fa fa-search-plus"></i> <span>Web Design</span>
						</a>
					</div>
					<a class="btn btn-default btn-block" data-toggle="modal"
						data-target="#project-11">Project Title</a>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="project-11" tabindex="-1" role="dialog"
					aria-labelledby="project-11-label" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="project-11-label">Project Title</h4>
							</div>
							<div class="modal-body">
								<h3>Project Description</h3>
								<div class="row">
									<div class="col-md-6">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Atque sed, quidem quis praesentium, ut unde. Quae sed,
											incidunt laudantium nesciunt, optio corporis quod earum
											pariatur omnis illo saepe numquam suscipit, nemo placeat
											dignissimos eius mollitia et quas officia doloremque ipsum
											labore rem deserunt vero! Magnam totam delectus accusantium
											voluptas et, tempora quos atque, fugiat, obcaecati
											voluptatibus commodi illo voluptates dolore nemo quo soluta
											quis.</p>
										<p>Molestiae sed enim laboriosam atque delectus voluptates
											rerum nostrum sapiente obcaecati molestias quasi optio
											exercitationem, voluptate quis consequatur libero incidunt,
											in, quod. Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Eos nobis officiis, autem earum tenetur quidem. Quae
											non dicta earum. Ipsum autem eaque cum dolor placeat corporis
											quisquam dolorum at nesciunt.</p>
									</div>
									<div class="col-md-6">
										<img src="images/portfolio-11.jpg" alt="">
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

			<div class="col-sm-6 col-md-3 isotope-item app-development">
				<div class="image-box">
					<div class="overlay-container">
						<img src="images/portfolio-12.jpg" alt=""> <a
							class="overlay" data-toggle="modal" data-target="#project-12">
							<i class="fa fa-search-plus"></i> <span>App Development</span>
						</a>
					</div>
					<a class="btn btn-default btn-block" data-toggle="modal"
						data-target="#project-12">Project Title</a>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="project-12" tabindex="-1" role="dialog"
					aria-labelledby="project-12-label" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="project-12-label">Project Title</h4>
							</div>
							<div class="modal-body">
								<h3>Project Description</h3>
								<div class="row">
									<div class="col-md-6">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Atque sed, quidem quis praesentium, ut unde. Quae sed,
											incidunt laudantium nesciunt, optio corporis quod earum
											pariatur omnis illo saepe numquam suscipit, nemo placeat
											dignissimos eius mollitia et quas officia doloremque ipsum
											labore rem deserunt vero! Magnam totam delectus accusantium
											voluptas et, tempora quos atque, fugiat, obcaecati
											voluptatibus commodi illo voluptates dolore nemo quo soluta
											quis.</p>
										<p>Molestiae sed enim laboriosam atque delectus voluptates
											rerum nostrum sapiente obcaecati molestias quasi optio
											exercitationem, voluptate quis consequatur libero incidunt,
											in, quod. Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Eos nobis officiis, autem earum tenetur quidem. Quae
											non dicta earum. Ipsum autem eaque cum dolor placeat corporis
											quisquam dolorum at nesciunt.</p>
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

		</div>
		<c:forEach var="travelInfoFood" items="${travelInfoFood }" varStatus="status"> 
			<div class="isotope-container row grid-space-20">
			<div class="col-sm-6 col-md-3 isotope-item cities">
				<div class="image-box">
					<div class="overlay-container">
						<img
							src="${pageContext.request.contextPath }/assets/images/paris.png"
							alt=""> <a class="overlay" data-toggle="modal"
							data-target="#project-1"> <i class="fa fa-search-plus"></i>
						</a>
					</div>
					<a class="btn btn-default btn-block" data-toggle="modal"
						data-target="#project-1"> ${travelInfoFood.name} </a>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="project-1" tabindex="-1" role="dialog"
					aria-labelledby="project-1-label" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="project-1-label">${travelInfoFood.name}</h4>
							</div>
							<div class="modal-body">
								<h3>${travelInfoFood.name}</h3>
								<div class="row">
									<div class="col-md-6">
										<p>${travelInfoFood.contents}</p>
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
				</div>
				<!-- Modal end -->
			</div>
		</c:forEach>
		
		<!-- portfolio items end -->

	</div>
</div>