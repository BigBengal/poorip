<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- drop down css -->
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="dist/css/prettydropdowns.css" rel="stylesheet" type="text/css">

<style>
body { background-color:#f7f7f7; font-family:'Roboto';}
.container { margin:150px auto; max-width:400px;}
</style>

</head>
<body>
	<div id="container">
<%-- 		<c:import url="/WEB-INF/views/include/blogheader.jsp" /> --%>
		<div id="wrapper">
			<div id="content" class="full-screen">
					<form action="${pageContext.request.contextPath}/admin/addTravel/upload" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
			      		<tr>
			      			<td class="t">여행정보이름</td>
			      			<td><input type="text" size="40" name="name"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">여행지 사진</td>
			      			<td><img src="${pageContext.request.contextPath}/list/${tvo.picture }"></td>      			
			      		</tr>      		
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td><input type="file" name="file" id="logo-file"></td>      			
			      		</tr>
			      		<tr>
			      			<td class="t">여행 정보 내용</td>
			      			<td><input type="text" size="40" name="contents"></td>
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
								<script src="http://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
								<script src="dist/js/jquery.prettydropdowns.js"></script>
								<script>
										$('select').prettyDropdown();
								</script>
								<script type="text/javascript">
// 									var _gaq = _gaq || [];
// 									_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
// 									_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
// 									_gaq.push([ '_trackPageview' ]);
		
									(function() {
										var ga = document.createElement('script');
										ga.type = 'text/javascript';
										ga.async = true;
										ga.src = ('https:' == document.location.protocol ? 'https://ssl'
												: 'http://www')
												+ '.google-analytics.com/ga.js';
										var s = document.getElementsByTagName('script')[0];
										s.parentNode.insertBefore(ga, s);
									})();
								</script>
							</td>
						</tr>
						<%-- <tr>
			      			<td class="t">여행지 위치(나라)</td>
			      			<td><select name="ctySeq">
									<c:forEach items="${list }" var="countryVo" varStatus="status">
										<option value="${countryVo.ctySeq }">${countryVo.ctyName }</option>
									</c:forEach>
							</select>
								<script src="http://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
								<script src="dist/js/jquery.prettydropdowns.js"></script>
								<script>
										$('select').prettyDropdown();
								</script>
								<script type="text/javascript">
// 									var _gaq = _gaq || [];
// 									_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
// 									_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
// 									_gaq.push([ '_trackPageview' ]);
		
									(function() {
										var ga = document.createElement('script');
										ga.type = 'text/javascript';
										ga.async = true;
										ga.src = ('https:' == document.location.protocol ? 'https://ssl'
												: 'http://www')
												+ '.google-analytics.com/ga.js';
										var s = document.getElementsByTagName('script')[0];
										s.parentNode.insertBefore(ga, s);
									})();
								</script>
							</td>
			      		</tr> --%>
						<tr>
			      			<td class="t">여행지 위치(도시)</td>
			      			<td><select name="ctySeq">
									<c:forEach items="${cityVo }" var="cityVo" varStatus="status">
										<option value="${cityVo.ctySeq }">${cityVo.ctyName }</option>
									</c:forEach>
							</select>
								<script src="http://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
								<script src="dist/js/jquery.prettydropdowns.js"></script>
								<script>
										$('select').prettyDropdown();
								</script>
								<script type="text/javascript">
// 									var _gaq = _gaq || [];
// 									_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
// 									_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
// 									_gaq.push([ '_trackPageview' ]);
		
									(function() {
										var ga = document.createElement('script');
										ga.type = 'text/javascript';
										ga.async = true;
										ga.src = ('https:' == document.location.protocol ? 'https://ssl'
												: 'http://www')
												+ '.google-analytics.com/ga.js';
										var s = document.getElementsByTagName('script')[0];
										s.parentNode.insertBefore(ga, s);
									})();
								</script>
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
		</div>
<%-- 		<c:import url="/WEB-INF/views/include/footer.jsp" /> --%>
	</div>
</body>
</html>