<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
body {
	background-color: #f7f7f7;
	font-family: 'Roboto';
}

.container {
	margin: 150px auto;
	max-width: 400px;
}

th, td {
	padding: 5px;
}

table {
	border-spacing: 5px;
	width: 100%;
	border: 1px solid #bcbcbc;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/vendor/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.iframe-transport.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.fileupload.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<body>
	<div id="container">
		<div id="wrapper">
		<!-------------------------------------------------- 여행 정보 추가 ---------------------------------------------------------->
			<div id="content" class="full-screen">
					<form action="${pageContext.request.contextPath}/admin/upload/travel" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
	 		      		<tr>
	 		      			<th><h3>여행 정보 추가</h3></th>
	 		      		</tr>
			      		<tr>
			      			<td class="t">여행정보이름</td>
			      			<td><input type="text" size="40" name="name"></td>
			      		</tr>
<!-- 			      		<tr> -->
<!-- 			      			<td class="t">여행지 사진</td> -->
<%-- 			      			<td><img src="${pageContext.request.contextPath}/list/${tvo.picture }"></td>      			 --%>
<!-- 			      		</tr>      		 -->
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td><input type="file" name="file" id="logo-file"></td>      			
			      		</tr>
			      		<tr>
			      			<td class="t">여행 정보 내용</td>
			      			<td>
			      			<textarea rows="4" cols="50"></textarea>
			      			</td>
			      		</tr>
			      		<tr>
			      			<td class="t">영업/개장 시간</td>
			      			<td><input type="text"size="40" name="hours"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">가격</td>
			      			<td><input type="text"size="40" name="price"></td>
			      		</tr>
						<tr>
							<td class="t">여행지 테마(카테고리)</td>
							<td><select name="catSeq">
									<c:forEach items="${cateVo }" var="cateVo" varStatus="status">
										<option value="${cateVo.catSeq }">${cateVo.catName }</option>
									</c:forEach>
							</select>
								
							</td>
						</tr>
						<tr>
			      			<td class="t">여행지 위치(도시)</td>
			      			<td><select name="ctySeq">
									<c:forEach items="${cityVo }" var="cityVo" varStatus="status">
										<option value="${cityVo.ctySeq }">${cityVo.ctyName }</option>
									</c:forEach>
							</select>
								
							</td>
			      		</tr>
						<tr>
			      			<td class="t">나머지 주소</td>
			      			<td><input type="text" size="40" name="location"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">mapURL</td>
			      			<td><input type="text" size="40" name="mapURL"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">여행지 연락처 정보</td>
			      			<td><input type="text" size="40" name="contact"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="여행지 추가"></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>
			
			<!-------------------------------------------------- 후기 추가 ---------------------------------------------------------->
			<div id="content" class="full-screen">
					<form action="${pageContext.request.contextPath}/admin/upload/post" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
	 		      		<tr>
	 		      			<th><h3>후기 작성</h3></th>
	 		      		</tr>
			      		<tr>
			      			<td class="t">제목</td>
			      			<td><input type="text" size="40" name="title"></td>
			      		</tr>

			      		<tr>
			      			<td class="t">후기 사진</td>
			      			<td><input type="file" name="file" id="file"></td>      			
			      		</tr>
			      		<tr>
			      			<td class="t">후기 내용</td>
			      			<td><input type="text" name="contents" id="contents"></td>
			      		</tr>
						<tr>
			      			<td class="t">후기 공개 여부</td>
			      			<td><input type="text" size="40" name="reviewPubYn"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">여행지 정보 seq</td>
			      			<td><input type="text" size="40" name="trvSeq1"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="후기 추가"></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>			
		</div>
	</div>
</body>
</html>