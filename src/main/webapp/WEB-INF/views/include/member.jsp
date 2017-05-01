<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container object-non-visible" data-animation-effect="fadeIn">
	<h1 id="clients" class="title text-center">Clients</h1>
	<div class="space"></div>
	<c:forEach items="${UserList}" var="userList" varStatus="status">
		<c:if test="${status.index % 3 == 0}">
			<div class="row">
		</c:if>
		<div class="col-md-4 col-sm-4 dropdown">
			<img src="${userList.usrProfile }" class="img-circle dropdown-toggle" data-toggle="dropdown">
			<ul class="dropdown-menu">
				<li><a href="#"> Action</a></li>
			</ul>
			${userList.usrNick}
			${userList.usrGender}
			
		</div>
		<c:if test="${status.index % 3 == 2}">
			</div>
		</c:if>
	</c:forEach>
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-4"> -->
<!-- 			<div class="media testimonial"> -->
<!-- 				<div class="media-left"> -->
<!-- 					<img src="assets/images/testimonial-1.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="media-body"> -->
<!-- 					<h3 class="media-heading">You are Amazing!</h3> -->
<!-- 					<blockquote> -->
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
<!-- 							Iure aperiam consequatur quo.</p> -->
<!-- 						<footer> -->
<%-- 							Someone famous in <cite title="Source Title">Source Title</cite> --%>
<!-- 						</footer> -->
<!-- 					</blockquote> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-4"> -->
<!-- 			<div class="media testimonial"> -->
<!-- 				<div class="media-left"> -->
<!-- 					<img src="assets/images/testimonial-2.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="media-body"> -->
<!-- 					<h3 class="media-heading">Yeah!</h3> -->
<!-- 					<blockquote> -->
<!-- 						<p>Iure aperiam consequatur quo quis exercitationem -->
<!-- 							reprehenderit dolor vel ducimus.</p> -->
<!-- 						<footer> -->
<%-- 							Someone famous in <cite title="Source Title">Source Title</cite> --%>
<!-- 						</footer> -->
<!-- 					</blockquote> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-4"> -->
<!-- 			<div class="media testimonial"> -->
<!-- 				<div class="media-left"> -->
<!-- 					<img src="assets/images/testimonial-3.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="media-body"> -->
<!-- 					<h3 class="media-heading">Thank You!</h3> -->
<!-- 					<blockquote> -->
<!-- 						<p>Aperiam consequatur quo quis exercitationem reprehenderit -->
<!-- 							suscipit iste placeat.</p> -->
<!-- 						<footer> -->
<%-- 							Someone famous in <cite title="Source Title">Source Title</cite> --%>
<!-- 						</footer> -->
<!-- 					</blockquote> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-4"> -->
<!-- 			<div class="media testimonial"> -->
<!-- 				<div class="media-left"> -->
<!-- 					<img src="assets/images/testimonial-2.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="media-body"> -->
<!-- 					<h3 class="media-heading">Thank You!</h3> -->
<!-- 					<blockquote> -->
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
<!-- 							Iure aperiam consequatur quo.</p> -->
<!-- 						<footer> -->
<%-- 							Someone famous in <cite title="Source Title">Source Title</cite> --%>
<!-- 						</footer> -->
<!-- 					</blockquote> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-4"> -->
<!-- 			<div class="media testimonial"> -->
<!-- 				<div class="media-left"> -->
<!-- 					<img src="assets/images/testimonial-3.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="media-body"> -->
<!-- 					<h3 class="media-heading">Amazing!</h3> -->
<!-- 					<blockquote> -->
<!-- 						<p>Iure aperiam consequatur quo quis exercitationem -->
<!-- 							reprehenderit dolor vel ducimus.</p> -->
<!-- 						<footer> -->
<%-- 							Someone famous in <cite title="Source Title">Source Title</cite> --%>
<!-- 						</footer> -->
<!-- 					</blockquote> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-4"> -->
<!-- 			<div class="media testimonial"> -->
<!-- 				<div class="media-left"> -->
<!-- 					<img src="assets/images/testimonial-1.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="media-body"> -->
<!-- 					<h3 class="media-heading">Best!</h3> -->
<!-- 					<blockquote> -->
<!-- 						<p>Aperiam consequatur quo quis exercitationem reprehenderit -->
<!-- 							suscipit iste placeat.</p> -->
<!-- 						<footer> -->
<%-- 							Someone famous in <cite title="Source Title">Source Title</cite> --%>
<!-- 						</footer> -->
<!-- 					</blockquote> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
</div>
<!-- section start -->
<!-- ================ -->
<div class="translucent-bg blue">
	<div class="container">
		<div class="list-horizontal">
			<div class="row">
				<div class="col-xs-2">
					<div class="list-horizontal-item">
						<img src="assets/images/client-1.png" alt="client">
					</div>
				</div>
				<div class="col-xs-2">
					<div class="list-horizontal-item">
						<img src="assets/images/client-2.png" alt="client">
					</div>
				</div>
				<div class="col-xs-2">
					<div class="list-horizontal-item">
						<img src="assets/images/client-3.png" alt="client">
					</div>
				</div>
				<div class="col-xs-2">
					<div class="list-horizontal-item">
						<img src="assets/images/client-4.png" alt="client">
					</div>
				</div>
				<div class="col-xs-2">
					<div class="list-horizontal-item">
						<img src="assets/images/client-5.png" alt="client">
					</div>
				</div>
				<div class="col-xs-2">
					<div class="list-horizontal-item">
						<img src="assets/images/client-6.png" alt="client">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- section end -->