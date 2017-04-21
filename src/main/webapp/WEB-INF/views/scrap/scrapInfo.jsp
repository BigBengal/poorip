<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:forEach var="travelInfoFood" items="${travelInfoFood }"
					varStatus="status">
					<div class="col-sm-6 col-md-3 isotope-item web-design">
						<div class="image-box">
							<div class="overlay-container">
								<img
									src="${pageContext.request.contextPath }/assets/images/paris.png"
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
										<a href=#><img id="scrapTrvInfo-${travelInfoFood.trvSeq}"
											src="--"
											style="float: right;"
											data-trvSeq="${travelInfoFood.trvSeq}" onclick="validate(${travelInfoFood.trvSeq})"/></a>
									
										<h2>
											<b>${travelInfoFood.name}</b>
										</h2>
										<div class="row">
											<div class="col-md-6">
												<p>${travelInfoFood.contents}</p>
											</div>
											<div class="col-md-6">
												<img
													src="${pageContext.request.contextPath }/assets/images/pool-party2.jpg"
													alt="" />
											</div>
										</div>

										<c:set var="reviewNum" value="${travelInfoFood.trvSeq}" />
										<div class='col-md-12'>
											<h3>
												<b>후기</b>
											</h3>
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